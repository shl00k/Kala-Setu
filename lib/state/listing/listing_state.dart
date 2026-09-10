import 'dart:io';
import '../../models/product.dart';

enum ListingStep { image, description, pricing, preview }

enum ListingStatus { idle, processing, saved, error }

class ListingState {
  final ListingStep step;
  final Product product;
  final File? selectedImage;
  final String transcript;
  final String imageAnalysis;
  final bool backgroundRemoved;
  final bool autoCropped;
  final bool lightingCorrected;
  final bool studioBackground;
  final ListingStatus status;
  final String? error;

  const ListingState({
    required this.step,
    required this.product,
    this.selectedImage,
    this.transcript = '',
    this.imageAnalysis = '',
    this.backgroundRemoved = false,
    this.autoCropped = false,
    this.lightingCorrected = false,
    this.studioBackground = false,
    this.status = ListingStatus.idle,
    this.error,
  });

  bool get isLoading => status == ListingStatus.processing;

  ListingState copyWith({
    ListingStep? step,
    Product? product,
    File? selectedImage,
    String? transcript,
    String? imageAnalysis,
    bool? backgroundRemoved,
    bool? autoCropped,
    bool? lightingCorrected,
    bool? studioBackground,
    ListingStatus? status,
    String? error,
    bool clearError = false,
  }) => ListingState(
        step: step ?? this.step,
        product: product ?? this.product,
        selectedImage: selectedImage ?? this.selectedImage,
        transcript: transcript ?? this.transcript,
        imageAnalysis: imageAnalysis ?? this.imageAnalysis,
        backgroundRemoved: backgroundRemoved ?? this.backgroundRemoved,
        autoCropped: autoCropped ?? this.autoCropped,
        lightingCorrected: lightingCorrected ?? this.lightingCorrected,
        studioBackground: studioBackground ?? this.studioBackground,
        status: status ?? this.status,
        error: clearError ? null : (error ?? this.error),
      );
}
