import 'package:evo_systems_mobile/models/films.dart';
import 'package:evo_systems_mobile/utils/constants.dart';
import 'package:evo_systems_mobile/utils/fonts.dart';
import 'package:evo_systems_mobile/utils/formatters.dart';
import 'package:evo_systems_mobile/widgets/back_btn.dart';
import 'package:evo_systems_mobile/widgets/overview_translator.dart';
import 'package:flutter/material.dart';

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
                style: Fonts(fontSize: 16.0, fontWeight: FontWeight.w600).fontBelleza(),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)
                ),
                child: widget.filme.imagemFundo.isNotEmpty ? 
                Image.network(
                  '${Constants.images}${widget.filme.imagemFundo}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fitWidth,
                )
                : const Icon(Icons.image_not_supported_rounded, size: 100.0),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OverviewTranslator(
                    textoOriginal: 'Overview',
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ), //Deixar para traduzir automaticamente
                  const SizedBox(height: 16),
                  OverviewTranslator(
                    textoOriginal: widget.filme.resumo,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
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
                        OverviewTranslator(
                          textoOriginal: 'Released',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(width: 5),
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
                        OverviewTranslator(
                          textoOriginal: 'Rating',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ), 
                        const SizedBox(width: 2.5),
                        const Icon(Icons.star, color: Constants.ratingColor,),
                        const SizedBox(width: 2.5),
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