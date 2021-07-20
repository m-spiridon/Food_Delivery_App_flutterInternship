import 'package:flutter/material.dart';
import 'package:internship_project_1/shared/px2dpx.dart';

class CategoryOption extends StatelessWidget {
  final name;
  final value;
  final icon;

  const CategoryOption({Key key, this.name, this.value, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          height: double.infinity,
          child: Icon(
            icon,
            color: Colors.teal[900],
            size: convertPx2Dpx(context, 16.0),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: convertPx2Dpx(context, 10.0),
            color: Colors.teal[800],
          ),
        ),
        subtitle: value == null
            ? null
            : Text(
                value,
              ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.teal[900],
        ),
        onTap: () {},
      ),
    );
  }
}
