import 'package:carousel_slider/carousel_slider.dart';
import 'package:evo_systems_mobile/page/details.dart';
import 'package:evo_systems_mobile/utils/constants.dart';
import 'package:flutter/material.dart';

class MainSlider extends StatelessWidget {
  const MainSlider({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length, 
        // ignore: non_constant_identifier_names
        itemBuilder: (context, itemIndex, PageViewIndex) 
        {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: 
                  (context) => DetailsPage(
                    filme: snapshot.data[itemIndex], 
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 300,
                width: 200,
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.images}${snapshot.data[itemIndex].poster}'
                ),
              ),
            ),
          );
        }, 
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        )
      ),
    );
  }
}