import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kala_setu/services/image/mediapipe_bridge.dart';
import 'package:uuid/uuid.dart';

import '../../models/product.dart';
import '../../services/ai/ai_service.dart';
import '../../services/bhashini/bhashini_service.dart';
import '../../services/image/image_service.dart';
import '../../services/pricing/pricing_service.dart';
import '../../services/speech/speech_service.dart';
import '../../services/ondc/ondc_service.dart';
import '../../services/market/market_data_service.dart';
import '../../repositories/product_repository.dart';
import 'listing_state.dart';

class ListingCubit extends Cubit<ListingState> {
  final ImageService imageService;
  final SpeechService speechService;
  final AiService aiService;
  final BhashiniService bhashiniService;
  final PricingService pricingService;
  final ProductRepository productRepository;
  final OndcService ondcService;
  final MarketDataService marketDataService;
  final MediaPipeBridge mediaPipeBridge;

  ListingCubit({
    required this.imageService,
    required this.speechService,
    required this.aiService,
    required this.bhashiniService,
    required this.pricingService,
    required this.productRepository,
    required this.ondcService,
    required this.marketDataService,
    required this.mediaPipeBridge,
  }) : super(
         ListingState(
           step: ListingStep.image,
           product: Product(id: const Uuid().v4(), createdAt: DateTime.now()),
         ),
       );

  void setImage(File image) => emit(
    state.copyWith(
      selectedImage: image,
      product: state.product.copyWith(
        originalImagePath: state.product.originalImagePath.isEmpty
            ? image.path
            : state.product.originalImagePath,
        imagePath: image.path,
      ),
      status: ListingStatus.idle,
      clearError: true,
    ),
  );

  Future<void> pickImage() async {
    try {
      final image = await imageService.pickFromGallery();
      if (image != null) setImage(image);
    } catch (e) {
      emit(state.copyWith(status: ListingStatus.error, error: e.toString()));
    }
  }

  Future<void> takePhoto() async {
    try {
      final image = await imageService.takePhoto();
      if (image != null) setImage(image);
    } catch (e) {
      emit(state.copyWith(status: ListingStatus.error, error: e.toString()));
    }
  }

  // Future<void> enhanceImage() async {
  //   final image = state.selectedImage;
  //   if (image == null) return;
  //   emit(state.copyWith(status: ListingStatus.processing, clearError: true));
  //   try {
  //     final result = await mediaPipeBridge.removeBackgroundAtPoint(
  //       image,
  //       0.5,
  //       0.5,
  //     );

  //     if (result == null) {
  //       throw Exception('MediaPipe did not return an enhanced image');
  //     }
  //     final enhancement = await imageService.enhanceWithReport(image);
  //     final enhanced = enhancement.file;
  //     final analysis = await aiService.analyzeImage(enhanced);
  //     emit(
  //       state.copyWith(
  //         selectedImage: enhanced,
  //         imageAnalysis: analysis,
  //         product: state.product.copyWith(imagePath: enhanced.path),
  //         backgroundRemoved: enhancement.backgroundRemoved,
  //         autoCropped: enhancement.autoCropped,
  //         lightingCorrected: enhancement.lightingCorrected,
  //         studioBackground: enhancement.studioBackground,
  //         status: ListingStatus.idle,
  //       ),
  //     );
  //   } catch (e) {
  //     emit(state.copyWith(status: ListingStatus.error, error: e.toString()));
  //   }
  // }

  Future<void> enhanceImage() async {
    final image = state.selectedImage;

    if (image == null) return;

    emit(state.copyWith(status: ListingStatus.processing, clearError: true));

    try {
      final result = await mediaPipeBridge.removeBackgroundAtPoint(
        image,
        0.5,
        0.5,
      );

      if (result == null) {
        throw Exception('MediaPipe did not return an enhanced image');
      }

      final analysis = await aiService.analyzeImage(result);

      emit(
        state.copyWith(
          selectedImage: result,
          imageAnalysis: analysis,
          product: state.product.copyWith(imagePath: result.path),
          backgroundRemoved: true,
          autoCropped: false,
          lightingCorrected: false,
          studioBackground: true,
          status: ListingStatus.idle,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ListingStatus.error, error: e.toString()));
    }
  }

  Future<void> recordDescription({required String language}) async {
    emit(state.copyWith(status: ListingStatus.processing, clearError: true));
    try {
      final transcript = await speechService.listen(
        localeId: '${language}_IN',
        onPartialResult: (partialTranscript) => emit(
          state.copyWith(
            transcript: partialTranscript,
            status: ListingStatus.processing,
          ),
        ),
      );
      emit(state.copyWith(transcript: transcript, status: ListingStatus.idle));
    } catch (e) {
      emit(state.copyWith(status: ListingStatus.error, error: e.toString()));
    }
  }

  Future<void> generateCatalog({required String language}) async {
    emit(state.copyWith(status: ListingStatus.processing, clearError: true));
    try {
      var transcript = state.transcript;
      // Translate to English for robust extraction, while preserving the selected output language.
      if (language != 'en' && transcript.trim().isNotEmpty) {
        transcript = await bhashiniService.translate(
          text: transcript,
          source: language,
          target: 'en',
        );
      }
      final product = await aiService.generateCatalog(
        product: state.product,
        transcript: transcript,
        outputLanguage: language,
        image: state.selectedImage,
      );
      emit(state.copyWith(product: product, status: ListingStatus.idle));
    } catch (e) {
      emit(state.copyWith(status: ListingStatus.error, error: e.toString()));
    }
  }

  void updateProduct(Product product) => emit(state.copyWith(product: product));

  Future<double?> loadMarketMedian(String category) async {
    try {
      final market = await marketDataService.getMarketPrice(category);
      if (market == null) return null;
      emit(
        state.copyWith(
          product: state.product.copyWith(marketMedian: market.medianPrice),
        ),
      );
      return market.medianPrice;
    } catch (_) {
      return null;
    }
  }

  void calculatePrice({
    required double materialCost,
    required double labourCost,
    required double marginPercent,
    double? marketMedian,
    int marketSamples = 0,
  }) {
    final pricing = pricingService.calculate(
      materialCost: materialCost,
      labourCost: labourCost,
      marginPercent: marginPercent,
      marketMedian: marketMedian,
      marketSamples: marketSamples,
    );
    emit(
      state.copyWith(
        product: state.product.copyWith(
          materialCost: materialCost,
          labourCost: labourCost,
          margin: marginPercent,
          recommendedPrice: pricing.recommendedPrice,
          marketMedian: pricing.marketMedian,
          marketFactor: pricing.marketFactor,
          pricingConfidence: pricing.confidence,
          pricingRationale: pricing.rationale,
        ),
      ),
    );
  }

  Future<void> saveProduct() async {
    emit(state.copyWith(status: ListingStatus.processing, clearError: true));
    try {
      await productRepository.save(state.product);
      emit(state.copyWith(status: ListingStatus.saved));
    } catch (e) {
      emit(state.copyWith(status: ListingStatus.error, error: e.toString()));
    }
  }

  Future<void> publishToOndc() async {
    emit(state.copyWith(status: ListingStatus.processing, clearError: true));
    try {
      await ondcService.publish(state.product);
      emit(state.copyWith(status: ListingStatus.idle));
    } catch (e) {
      emit(state.copyWith(status: ListingStatus.error, error: e.toString()));
    }
  }

  Future<String> ondcPayload() =>
      ondcService.createSellerPayload(state.product);

  void nextStep() {
    final next = switch (state.step) {
      ListingStep.image => ListingStep.description,
      ListingStep.description => ListingStep.pricing,
      ListingStep.pricing => ListingStep.preview,
      ListingStep.preview => ListingStep.preview,
    };
    emit(state.copyWith(step: next, clearError: true));
  }

  void previousStep() {
    final previous = switch (state.step) {
      ListingStep.image => ListingStep.image,
      ListingStep.description => ListingStep.image,
      ListingStep.pricing => ListingStep.description,
      ListingStep.preview => ListingStep.pricing,
    };
    emit(state.copyWith(step: previous, clearError: true));
  }
}
