import 'dart:ui';

import 'package:evo_systems_mobile/utils/constants.dart';
import 'package:translator/translator.dart';
  
class Translate 
{
  final translator = GoogleTranslator();
  late bool isEnglish;  
  late String appCurrentLanguage;
  
  Translate(){
    _initializeLocale();
  }

  Future<void> _initializeLocale() async {
    appCurrentLanguage = PlatformDispatcher.instance.locale.languageCode;
    isEnglish = _isCurrentLanguageEnglish();
  }
  
  bool _isCurrentLanguageEnglish() {
    return appCurrentLanguage == 'en';
  }

  Future<String> traduzirTexto(String texto) async 
  {
    final traduzido = await translator.translate(
      texto,
      from: Constants.currentLanguage,
      to: appCurrentLanguage,
    );
    return traduzido.text;
  }
}