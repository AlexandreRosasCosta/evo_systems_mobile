import 'package:evo_systems_mobile/api/api_films.dart';
import 'package:evo_systems_mobile/models/films.dart';
import 'package:evo_systems_mobile/page/search.dart';
import 'package:evo_systems_mobile/services/translator.dart';
import 'package:evo_systems_mobile/widgets/film_slider.dart';
import 'package:evo_systems_mobile/widgets/main_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget 
{
  const HomePage({ super.key });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> 
{
  late Future<List<Films>> filmesTrending;
  late Future<List<Films>> filmesTopRated;
  late Future<List<Films>> filmesUpcoming;

  @override
  void initState()
  {
    super.initState();
    filmesTrending = ApiFilmes().getTrendingFilmes();
    filmesTopRated = ApiFilmes().getTopRatedFilmes();
    filmesUpcoming = ApiFilmes().getUpcomingFilmes();
  }

  @override
  Widget build(BuildContext context) {

    var topicos = GoogleFonts.aBeeZee(fontSize: 20);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          child: Text("FILMS", style: GoogleFonts.aBeeZee(fontSize: 30),)
          ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: ()
            {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const Search()),  
              );
            }, 
            icon: const Icon(Icons.search, size: 30,),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Translate().isEnglish ?
              Text(
                "Trending",  //Deixar para traduzir automaticamente
                style: topicos,
              )
              : Text(
                "Em Alta",
                style: topicos,
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: FutureBuilder(future: filmesTrending, builder: (context, snapshot) {
                  if(snapshot.hasError)
                  {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return MainSlider(snapshot: snapshot,);
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }),
              ),
              const SizedBox(height: 20),
              Translate().isEnglish ?
              Text(
                "Top Rated",  //Deixar para traduzir automaticamente
                style: topicos,
              )
              : Text(
                "Mais Avaliados",
                style: topicos,
              ), 
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(future: filmesTopRated, builder: (context, snapshot) {
                  if(snapshot.hasError)
                  {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return FilmSlider(snapshot: snapshot,);
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }),
              ),
              const SizedBox(height: 20),
              Translate().isEnglish ? //Deixar para traduzir automaticamente
              Text(
                "Upcoming", 
                style: topicos,
              )
              : Text(
                "Em Breve",
                style: topicos,
              ), 
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(future: filmesUpcoming, builder: (context, snapshot) {
                  if(snapshot.hasError)
                  {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return FilmSlider(snapshot: snapshot,);
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }),
              ),
            ],
          ),
        ),
        ),
    );
  }
}

