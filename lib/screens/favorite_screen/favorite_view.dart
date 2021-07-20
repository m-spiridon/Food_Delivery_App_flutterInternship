import 'package:flutter/material.dart';
import 'package:internship_project_1/screens/favorite_screen/favorite_modal.dart';

class FavoriteView extends StatefulWidget {
  final id;

  FavoriteView(this.id);

  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.favorite_border,
          color: Colors.black,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return FavoriteModal(widget.id);
            },
          );
        },
      ),
    );
  }
}
