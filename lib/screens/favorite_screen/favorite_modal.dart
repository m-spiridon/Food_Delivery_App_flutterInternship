import 'package:flutter/material.dart';
import 'package:internship_project_1/screens/account_screen/shopping_screen/models/groups_mock.dart';

import 'favorite_single_group.dart';

class FavoriteModal extends StatelessWidget {
  final id;
  FavoriteModal(this.id);

  //const FavoriteModal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.builder(
          itemCount: basicGroups.length,
          itemBuilder: (context, index) {
            return FavoriteSingleGroup(id, basicGroups[index].name);
          }),
    );
  }
}
