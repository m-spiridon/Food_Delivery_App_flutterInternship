import 'package:flutter/material.dart';

class OnboardingScreenSlide extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  OnboardingScreenSlide({this.image, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 35.0,
                  right: 35.0,
                  bottom: 50.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                   left: 35.0,
                  right: 35.0,
                  bottom: 75.0),
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}
