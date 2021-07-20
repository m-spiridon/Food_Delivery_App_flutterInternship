import 'package:flutter/material.dart';
import 'package:internship_project_1/shared/colors.dart';

class TabsDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[350],
      height: 1.0,
    );
  }
}

class RecipeTab extends StatelessWidget {
  final Widget navigateTo;
  final title;

  RecipeTab({this.title, this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigateTo == null
          ? () {}
          : () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => navigateTo));
            },
      child: Container(
        padding: EdgeInsets.only(top: 15.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)),
            Icon(
              Icons.chevron_right,
              size: 30.0,
            )
          ],
        ),
      ),
    );
  }
}

class DetailsTab extends StatelessWidget {
  final String title;
  final String subTitle;
  final icon;

  DetailsTab({this.title, this.subTitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            icon,
            color: Colors.black,
            size: 36.0,
          ),
          title: Text(title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
          subtitle: subTitle == null
              ? null
              : Text(subTitle, style: TextStyle(fontSize: 16.0)),
          trailing: Icon(
            Icons.chevron_right,
            size: 36.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class SwitchingTab extends StatefulWidget {
  final String title;
  final String subTitle;
  final icon;

  SwitchingTab({this.title, this.subTitle, this.icon});

  @override
  _SwitchingTabState createState() => _SwitchingTabState();
}

class _SwitchingTabState extends State<SwitchingTab> with RestorationMixin {
  RestorableBool switchValue = RestorableBool(false);

  @override
  String get restorationId => 'switch_email_notification';

  @override
  void restoreState(RestorationBucket oldBucket, bool initialRestore) {
    registerForRestoration(switchValue, 'switch_email_notification');
  }

  @override
  void dispose() {
    switchValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            widget.icon,
            color: Colors.black,
            size: 32.0,
          ),
          title: Text(widget.title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
          subtitle: widget.subTitle == null
              ? null
              : Text(widget.subTitle, style: TextStyle(fontSize: 16.0)),
          trailing: Switch(
              activeColor: orange,
              value: switchValue.value,
              onChanged: (value) {
                setState(() {
                  switchValue.value = value;
                });
              }),
        ),
      ),
    );
  }
}
