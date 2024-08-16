import 'package:evo_systems_mobile/models/films.dart';
import 'package:evo_systems_mobile/services/translator.dart';
import 'package:evo_systems_mobile/utils/constants.dart';
import 'package:evo_systems_mobile/utils/formatters.dart';
import 'package:evo_systems_mobile/widgets/back_btn.dart';
import 'package:evo_systems_mobile/widgets/overview_translator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  final Films filme;

  const DetailsPage({ 
    super.key, 
    required this.filme 
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const BackBtn(),
            backgroundColor: Constants.backgroundColor,
            expandedHeight: 200,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.filme.titulo, 
                style: GoogleFonts.belleza(
                  fontSize: 17,
                  fontWeight: FontWeight.w600
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)
                ),
                child: Image.network(
                  '${Constants.images}${widget.filme.imagemFundo}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Translate().isEnglish ? 'Overview' : 'Resumo', //Deixar para traduzir automaticamente
                    style: GoogleFonts.openSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  const SizedBox(height: 16),
                  OverviewTranslator(
                    textoOriginal: widget.filme.resumo, 
                    translationService: Translate(), 
                    filme: widget.filme
                  ), 
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          Translate().isEnglish ? 'Release: ' : 'Lançamento: ', //Deixar para traduzir automaticamente
                          style: GoogleFonts.roboto(
                            fontSize: 17, 
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(Formatters().formatarData(widget.filme.dataLancamento))
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Text(
                          Translate().isEnglish ? 'Rating ' : 'Avaliações ', //Deixar para traduzir automaticamente
                          style: GoogleFonts.roboto(
                              fontSize: 17, 
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const Icon(Icons.star, color: Constants.ratingColor,),
                        Text('${widget.filme.classificacao.toStringAsFixed(1)}/10')
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        
      ),
    );
  }
}