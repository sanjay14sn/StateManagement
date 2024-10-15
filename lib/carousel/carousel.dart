import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart' as carousel_controller;


class Carousel extends StatelessWidget {
  // List of local image paths
  final List<String> imagePaths = [
    'assets/pexels-daredevil-27139277.jpg',
    'assets/101441-pongal-outfits.jpeg',
    'assets/mngko_1200.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 75,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.5,
        ),
        items: imagePaths.map((path) => Container(
          child: Center(
            child: Image.asset(path, fit: BoxFit.cover, width: 1000),
          ),
        )).toList(),
      ),
    );
  }
}
