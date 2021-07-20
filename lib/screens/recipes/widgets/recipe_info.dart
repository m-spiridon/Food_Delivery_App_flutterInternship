import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';

class RecipeInfo extends StatelessWidget {
  final name;
  final timeToCook;
  final price;
  final portions;

  const RecipeInfo(
      {Key key, this.name, this.timeToCook, this.price, this.portions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$name',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.timer),
                  Text(
                    S.of(context).recipeCardTimeToCook('$timeToCook'),
                  ),
                  SizedBox(width: 10.0),
                  Icon(Icons.restaurant),
                  Text('$portions'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.euro),
                  Text(
                    '$price',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
