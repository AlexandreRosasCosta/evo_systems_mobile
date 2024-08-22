import 'package:evo_systems_mobile/api/api_films.dart';
import 'package:evo_systems_mobile/models/films.dart';
import 'package:evo_systems_mobile/page/details.dart';
import 'package:evo_systems_mobile/services/translator.dart';
import 'package:evo_systems_mobile/utils/constants.dart';
import 'package:evo_systems_mobile/utils/formatters.dart';
import 'package:evo_systems_mobile/widgets/back_btn.dart';
import 'package:evo_systems_mobile/widgets/overview_translator.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({ super.key });

  
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Films> filmes = [];
  ApiFilmes api = ApiFilmes();
  String? hintText= 'Enter the movie name...',
  ano = 'Year',
  classificacao = 'Released';

  @override
  void initState() {
    super.initState();
    _dynamicText();
  }

  Future<void> _dynamicText() async {
    hintText = Translate().isEnglish? 'Enter the movie name...' : await Translate().traduzirTexto('Enter the movie name...');
    ano =Translate().isEnglish? 'Year': await Translate().traduzirTexto('Year');
    classificacao = Translate().isEnglish? 'Rating': await Translate().traduzirTexto('Rating');
    setState(() {}); 
  }

  void buscarFilmes(String query) async
  {
    if(query.isNotEmpty)
    {
    List<Films> resultados = await ApiFilmes.searchFilme(query);
      setState(() {
        filmes = resultados;
      });
    }
    else
    {
      setState(() {
        filmes = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackBtn(),
        backgroundColor: Constants.backgroundColor,
        title: OverviewTranslator(
                textoOriginal: 'Search',
                fontSize: 20,
                fontWeight: FontWeight.normal,
               ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Barra de Pesquisa
            TextField(
              decoration: InputDecoration(
                hintText: hintText ?? 'Enter de movie name...', 
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: buscarFilmes,
            ),
            const SizedBox(height: 20),
            // Resultados da Busca
            Expanded(
              child: ListView.builder(
                itemCount: filmes.length,
                itemBuilder: (context, index) {
                  final filme = filmes[index];
                  return ListTile(
                    leading: filme.poster.isNotEmpty 
                    ? Image.network(
                        '${Constants.images}${filme.poster}',
                        fit: BoxFit.cover,
                        width: 50.0,
                        height: 50.0,
                      )
                    : const Icon(Icons.image_not_supported, size: 50.0),
                    title: Text(filme.titulo),
                    subtitle: Text(
                      '$ano: ${Formatters().formatarAno(filme.dataLancamento)} | $classificacao: ${filme.classificacao.toStringAsFixed(1)}',
                    ),
                    onTap: (){
                        Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: 
                          (context) => DetailsPage(
                            filme: filme, 
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}