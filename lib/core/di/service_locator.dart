import 'package:get_it/get_it.dart';
import 'package:kala_setu/services/image/mediapipe_bridge.dart';

import '../../data/local/app_database.dart';
import '../../repositories/artisan_repository.dart';
import '../../repositories/product_repository.dart';
import '../../services/ai/ai_service.dart';
import '../../services/ai/gemini_ai_service.dart';
import '../../services/backend/backend_service.dart';
import '../../services/backend/supabase_backend_service.dart';
import '../../services/bhashini/bhashini_http_service.dart';
import '../../services/bhashini/bhashini_service.dart';
import '../../services/image/image_enhancement_service.dart';
import '../../services/image/image_picker_service.dart';
import '../../services/image/image_service.dart';
import '../../services/ondc/ondc_adapter.dart';
import '../../services/ondc/ondc_service.dart';
import '../../services/market/market_data_service.dart';
import '../../services/market/supabase_market_data_service.dart';
import '../../services/pricing/hybrid_pricing_service.dart';
import '../../services/pricing/pricing_service.dart';
import '../../services/speech/speech_service.dart';
import '../../services/speech/speech_to_text_service.dart';
import '../../services/storage/drift_local_storage_service.dart';
import '../../services/storage/local_storage_service.dart';
import '../../state/listing/listing_cubit.dart';
import '../../state/products/products_cubit.dart';
import '../../state/language/language_cubit.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  if (getIt.isRegistered<AppDatabase>()) return;

  getIt.registerLazySingleton<AppDatabase>(AppDatabase.new);
  getIt.registerLazySingleton<LocalStorageService>(
    () => DriftLocalStorageService(getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<BackendService>(SupabaseBackendService.new);
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepository(
      localStorage: getIt<LocalStorageService>(),
      backend: getIt<BackendService>(),
    ),
  );
  getIt.registerLazySingleton<ArtisanRepository>(ArtisanRepository.new);

  getIt.registerLazySingleton<GeminiAiService>(GeminiAiService.new);
  getIt.registerLazySingleton<AiService>(() => getIt<GeminiAiService>());

  getIt.registerLazySingleton<ImagePickerService>(ImagePickerService.new);
  getIt.registerLazySingleton<ImageService>(
    () => ImageEnhancementService(getIt<ImagePickerService>()),
  );

  getIt.registerLazySingleton<MediaPipeBridge>(MediaPipeBridge.new);

  getIt.registerLazySingleton<SpeechService>(SpeechToTextService.new);
  getIt.registerLazySingleton<BhashiniService>(BhashiniHttpService.new);
  getIt.registerLazySingleton<PricingService>(HybridPricingService.new);
  getIt.registerLazySingleton<OndcService>(OndcAdapter.new);
  getIt.registerLazySingleton<MarketDataService>(SupabaseMarketDataService.new);

  getIt.registerFactory<LanguageCubit>(LanguageCubit.new);
  getIt.registerFactory<ListingCubit>(
    () => ListingCubit(
      imageService: getIt<ImageService>(),
      speechService: getIt<SpeechService>(),
      aiService: getIt<AiService>(),
      bhashiniService: getIt<BhashiniService>(),
      pricingService: getIt<PricingService>(),
      productRepository: getIt<ProductRepository>(),
      ondcService: getIt<OndcService>(),
      marketDataService: getIt<MarketDataService>(),
      mediaPipeBridge: getIt<MediaPipeBridge>(),
    ),
  );
  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(getIt<ProductRepository>()),
  );
}
