import 'package:translator/translator.dart';

class Translate 
{
  final translator = GoogleTranslator();
  bool isEnglish = false;  
    
  Future<String> traduzirTexto(String texto, String inputLanguage, String outputLanguage) async 
  {
    final traduzido = await translator.translate(
      texto,
      from: inputLanguage,
      to: outputLanguage
    );
    return traduzido.text;
  }
}