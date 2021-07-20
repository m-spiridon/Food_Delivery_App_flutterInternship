import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/mocks/onboarding_screen_mock.dart';
import 'package:internship_project_1/screens/onboarding_screen/onboarding_screen_slide.dart';
import 'package:internship_project_1/shared/colors.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = 'onboarding_screen';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  CarouselController buttonCarouselController = CarouselController();

  double currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
            clipBehavior: Clip.hardEdge,
            child: CarouselSlider(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                scrollPhysics: ClampingScrollPhysics(),
                onPageChanged: (int index, reason) {
                  setState(() {
                    currentIndexPage = index.toDouble();
                  });
                },
              ),
              items: onboardingItems.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return OnboardingScreenSlide(
                      image: item['image'],
                      title: item['title'],
                      subtitle: item['subtitle'],
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Stack(clipBehavior: Clip.none, children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Positioned(
              top: -20,
              left: MediaQuery.of(context).size.width * 0.5 - 20,
              child: ClipOval(
                child: Material(
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    color: orange,
                    child: IconButton(
                      iconSize: 25.0,
                      onPressed: () {
                        currentIndexPage < onboardingItems.length - 1
                            ? buttonCarouselController.nextPage()
                            : Navigator.pushNamed(context, 'home_screen');
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                maintainAnimation: true,
                maintainState: true,
                maintainSize: true,
                visible: currentIndexPage > 0,
                child: TextButton(
                    onPressed: () {
                      buttonCarouselController.previousPage();
                    },
                    child: Text(S.of(context).backBtnText,
                        style: TextStyle(color: Colors.black, fontSize: 18.0))),
              ),
              DotsIndicator(
                dotsCount: onboardingItems.length,
                position: currentIndexPage,
                decorator: DotsDecorator(
                  activeColor: orange,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              Visibility(
                maintainAnimation: true,
                maintainState: true,
                maintainSize: true,
                visible: currentIndexPage < onboardingItems.length - 1,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'home_screen');
                  },
                  child: Text(
                    S.of(context).skipBtnText,
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
