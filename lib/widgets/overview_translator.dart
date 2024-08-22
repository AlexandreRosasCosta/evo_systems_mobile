import 'package:evo_systems_mobile/services/translator.dart';
import 'package:evo_systems_mobile/utils/fonts.dart';
import 'package:flutter/material.dart';

class OverviewTranslator extends StatelessWidget {
  final String textoOriginal;
  final Translate translationService = Translate();
  final double? fontSize;
  final FontWeight fontWeight;


  OverviewTranslator({ 
    super.key, 
    required this.textoOriginal,
    required this.fontSize,
    required this.fontWeight
  });
  
  @override
  Widget build(BuildContext context) {
    return translationService.isEnglish ?
      Text(
        textoOriginal,
        style: Fonts(fontSize: fontSize, fontWeight: fontWeight).fontRoboto(),
      )
    :
    FutureBuilder<String>(
      future: translationService.traduzirTexto(textoOriginal), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Erro ao traduzir o texto...'); 
        } else {
          return Text(
            snapshot.data ?? 'Texto não disponível', 
            style: Fonts(fontSize: fontSize, fontWeight: fontWeight).fontRoboto(),//20, FontWeight.w500
          );
        }
      },
    );
  }
}