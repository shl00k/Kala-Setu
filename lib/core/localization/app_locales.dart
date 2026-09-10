import 'package:flutter/material.dart';

class AppLanguage {
  final String code;
  final String name;
  final String nativeName;
  final String speechLocale;

  const AppLanguage(this.code, this.name, this.nativeName, this.speechLocale);
}

const supportedLanguages = <AppLanguage>[
  AppLanguage('en', 'English', 'English', 'en_IN'),
  AppLanguage('hi', 'Hindi', 'हिन्दी', 'hi_IN'),
  AppLanguage('ta', 'Tamil', 'தமிழ்', 'ta_IN'),
  AppLanguage('te', 'Telugu', 'తెలుగు', 'te_IN'),
  AppLanguage('mr', 'Marathi', 'मराठी', 'mr_IN'),
  AppLanguage('bn', 'Bengali', 'বাংলা', 'bn_IN'),
  AppLanguage('gu', 'Gujarati', 'ગુજરાતી', 'gu_IN'),
  AppLanguage('kn', 'Kannada', 'ಕನ್ನಡ', 'kn_IN'),
  AppLanguage('ml', 'Malayalam', 'മലയാളം', 'ml_IN'),
  AppLanguage('pa', 'Punjabi', 'ਪੰਜਾਬੀ', 'pa_IN'),
];

class AppStrings {
  static const Map<String, Map<String, String>> _data = {
    'en': {
      'app': 'कला Setu',
      'selectLanguage': 'Select language',
      'home': 'Home',
      'createListing': 'Create Smart Listing',
      'myProducts': 'My Products',
      'enhance': 'Enhance',
      'describe': 'Describe',
      'price': 'Price',
      'preview': 'Preview',
      'takePhoto': 'Take photo',
      'gallery': 'Gallery',
      'enhancePhoto': 'Enhance photo',
      'record': 'Record description',
      'stop': 'Stop',
      'generateCatalog': 'Generate catalog',
      'calculatePrice': 'Calculate price',
      'save': 'Save listing',
      'publish': 'Publish to ONDC',
      'offline': 'Offline',
      'synced': 'Synced',
    },
    'hi': {
      'app': 'कला सेतु',
      'selectLanguage': 'भाषा चुनें',
      'home': 'होम',
      'createListing': 'स्मार्ट लिस्टिंग बनाएं',
      'myProducts': 'मेरे उत्पाद',
      'enhance': 'फोटो सुधारें',
      'describe': 'विवरण',
      'price': 'कीमत',
      'preview': 'पूर्वावलोकन',
      'takePhoto': 'फोटो लें',
      'gallery': 'गैलरी',
      'enhancePhoto': 'फोटो सुधारें',
      'record': 'विवरण बोलें',
      'stop': 'रोकें',
      'generateCatalog': 'कैटलॉग बनाएं',
      'calculatePrice': 'कीमत निकालें',
      'save': 'लिस्टिंग सेव करें',
      'publish': 'ONDC पर प्रकाशित करें',
      'offline': 'ऑफलाइन',
      'synced': 'सिंक किया गया',
    },
  };

  static String text(String key, String language) =>
      _data[language]?[key] ?? _data['en']![key] ?? key;

  static Locale locale(String code) => Locale(code);
}
