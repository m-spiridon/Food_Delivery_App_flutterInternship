import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/account_screen/shopping_screen/models/group.dart';
import 'package:internship_project_1/screens/account_screen/shopping_screen/models/groups_mock.dart';
import 'package:internship_project_1/screens/account_screen/shopping_screen/models/mock.dart';
import 'package:internship_project_1/shared/px2dpx.dart';

class ModalWindowAdd extends StatefulWidget {
  @override
  _ModalWindowAddState createState() => _ModalWindowAddState();
}

class _ModalWindowAddState extends State<ModalWindowAdd> {
  final titleController = TextEditingController();

  void _addNewGroup() {
    if (titleController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final newGroup = new Group(name: enteredTitle, products: products);
    setState(() {
      basicGroups.add(newGroup);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          padding: EdgeInsets.only(
            top: convertPx2Dpx(context, 3),
            left: convertPx2Dpx(context, 3),
            right: convertPx2Dpx(context, 3),
            bottom: convertPx2Dpx(context, 6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                decoration: InputDecoration(labelText: S.of(context).title),
                controller: titleController,
                //onSubmitted: (_) => _submitData,
              ),
              ElevatedButton(
                onPressed: _addNewGroup,
                child: Text(S.of(context).addShoppingList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
