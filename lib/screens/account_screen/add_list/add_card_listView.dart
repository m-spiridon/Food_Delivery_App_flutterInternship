import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/account_screen/add_list/modal_add.dart';
import 'package:internship_project_1/shared/px2dpx.dart';

class AddOne extends StatelessWidget {
  const AddOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green[200],
          width: 1,
        ),
        color: Colors.transparent,
      ),
      margin: EdgeInsets.all(convertPx2Dpx(context, 4)),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(convertPx2Dpx(context, 9)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return ModalWindowAdd();
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.add),
                      Text(
                        S.of(context).addShoppingList,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
