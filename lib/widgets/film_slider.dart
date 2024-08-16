import 'package:evo_systems_mobile/page/details.dart';
import 'package:evo_systems_mobile/utils/constants.dart';
import 'package:flutter/material.dart';

class FilmSlider extends StatelessWidget {
  const FilmSlider({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, 
      width: double.infinity, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) 
        {
          return Container(
            margin: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        filme: snapshot.data[index],
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 200, 
                    width: 150,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${Constants.images}${snapshot.data![index].poster}',
                    ),
                  ),
                ),
              ),
          );
        },
      ),
    );
  }
}

