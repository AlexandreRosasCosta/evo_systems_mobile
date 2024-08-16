import 'package:evo_systems_mobile/models/films.dart';
import 'package:evo_systems_mobile/services/translator.dart';
import 'package:evo_systems_mobile/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OverviewTranslator extends StatelessWidget {
  final String textoOriginal;
  final Translate translationService;
  final Films filme;

  const OverviewTranslator({ 
    super.key, 
    required this.textoOriginal, 
    required this.translationService, 
    required this.filme 
  });
  
  @override
  Widget build(BuildContext context) {
    if (Translate().isEnglish) {
      return Text(
        filme.resumo,
        style: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      );
    } else {
      return FutureBuilder<String>(
        future: Translate().traduzirTexto(filme.resumo, Constants.currentLanguage, 'pt'), //Deixar para traduzir automaticamente
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text('Erro ao traduzir o texto...'); //Deixar para traduzir automaticamente
          } else {
            return Text(
              snapshot.data ?? 'Texto não disponível', //Deixar para traduzir automaticamente
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            );
          }
        },
      );
    }
  }
}