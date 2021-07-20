import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:internship_project_1/shared/colors.dart';

class WrapCarousel extends StatelessWidget {
  List wraps;
  WrapCarousel({this.wraps});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.05,
          viewportFraction: 0.33,
        ),
        items: wraps.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      '$i',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ));
            },
          );
        }).toList(),
      ),
    );
  }
}
