import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';

class ViewAllBtn extends StatelessWidget {
  final Function onClick;

  ViewAllBtn({this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Row(
        children: [
          Text(
            S.of(context).viewAllBtnText,
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.black,
            size: 32.0,
          )
        ],
      ),
    );
  }
}
