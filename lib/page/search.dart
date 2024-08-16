import 'package:evo_systems_mobile/api/api_films.dart';
import 'package:evo_systems_mobile/models/films.dart';
import 'package:evo_systems_mobile/page/details.dart';
import 'package:evo_systems_mobile/services/translator.dart';
import 'package:evo_systems_mobile/utils/constants.dart';
import 'package:evo_systems_mobile/utils/formatters.dart';
import 'package:evo_systems_mobile/widgets/back_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  const Search({ super.key });

  
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Films> filmes = [];
  ApiFilmes api = ApiFilmes();

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
        title: Translate().isEnglish ? //Deixar para traduzir automaticamente
              Text(
                "Search", 
                style: GoogleFonts.aBeeZee(fontSize: 20),
              )
              : Text(
                "Pesquisar",
                style: GoogleFonts.aBeeZee(fontSize: 20),
              ), 

              // Fica mais ou menos assim com o tradutor:
              /*:  FutureBuilder(
                future: Translate().traduzirTexto('Search', Constants.currentLanguage, 'pt'), 
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text('Erro ao traduzir o texto...');
                  } else {
                    return Text(
                      snapshot.data ?? 'Texto não disponível',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }
                },
              ), */

        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Barra de Pesquisa
            TextField(
              decoration: InputDecoration(
                hintText: Translate().isEnglish ? 'Enter de movie name...' : 'Digite o nome do filme...',
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
                      'Ano: ${Formatters().formatarAno(filme.dataLancamento)} | Classificação: ${filme.classificacao.toStringAsFixed(1)}',
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