import 'package:flutter/material.dart';
import 'package:internship_project_1/components/categories/category_name.dart';
import 'package:internship_project_1/components/tabs_widgets.dart';
import 'package:internship_project_1/screens/profile_details/profile_data.dart';
import 'package:internship_project_1/generated/l10n.dart';

class ProfileDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CategoryName(
              name: S.of(context).categoryPersonalDetails,
            ),
            TabsDivider(),
            DetailsTab(
                title: S.of(context).optionName,
                subTitle: profileDetails['name'],
                icon: Icons.person_outline),
            TabsDivider(),
            DetailsTab(
                title: S.of(context).optionContactDetails,
                subTitle: profileDetails['email'],
                icon: Icons.phone_outlined),
            TabsDivider(),
            DetailsTab(
                title: S.of(context).optionChangePassword,
                icon: Icons.lock_outlined),
            TabsDivider(),
            SizedBox(height: 10.0),
            CategoryName(
              name: S.of(context).optionAddress,
            ),
            TabsDivider(),
            DetailsTab(
                title: S.of(context).optionAddress,
                subTitle: S.of(context).deliveryAddress,
                icon: Icons.location_on_outlined),
            TabsDivider(),
            SizedBox(height: 10.0),
            CategoryName(
              name: S.of(context).categoryEmailPreferences,
            ),
            SwitchingTab(
                title: S.of(context).optionReceiveNewsletters,
                icon: Icons.email_outlined),
            TabsDivider(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              child: Text(
                bottomParagraph,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
