import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/localization/app_locales.dart';

class LanguageCubit extends Cubit<String> {
  LanguageCubit() : super('en');

  void changeLanguage(String code) => emit(code);

  AppLanguage get current => supportedLanguages.firstWhere(
        (language) => language.code == state,
        orElse: () => supportedLanguages.first,
      );
}
