import 'package:flutter/material.dart';
import 'package:internship_project_1/screens/products/producers_options.dart';
import 'package:internship_project_1/screens/products_by_food_type_screen/products_by_food_type_screen.dart';
import 'package:internship_project_1/shared/producer_data.dart';

class FoodTypeCard extends StatelessWidget {
  final name;
  final background;

  const FoodTypeCard({Key key, this.name, this.background}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(background),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Center(
            child: Text(
              name,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                print("food type $name is tapped");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsByFoodTypeScreen(
                      foodType: name,
                    ),
                  ),
                );
              },
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProducersOptions(
                            foodType: name,
                            producersOptions: producers,
                            image: background,
                          )),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
