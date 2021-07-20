import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/shared/colors.dart';
import 'package:internship_project_1/shared/input_border.dart';
import 'package:internship_project_1/shared/regex.dart';

class ResetPasswordDialog extends StatefulWidget {
  @override
  _ResetPasswordDialogState createState() => _ResetPasswordDialogState();
}

class _ResetPasswordDialogState extends State<ResetPasswordDialog> {
  final _resetPasswordKey = GlobalKey<FormState>();

  final TextEditingController _resetPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 50.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close),
              ),
            ),
            Text(S.of(context).resetYourPassword,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 20.0),
              child: Form(
                key: _resetPasswordKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(S.of(context).email,
                          style: TextStyle(
                              color: _resetPasswordController.text.isEmpty
                                  ? Colors.grey
                                  : Colors.black,
                              height: 1.5)),
                    ),
                    TextFormField(
                        controller: _resetPasswordController,
                        cursorColor: _resetPasswordController.text.isEmpty
                            ? Colors.grey
                            : Colors.black,
                        decoration: InputDecoration(
                            focusedBorder:
                                inputBorder(_resetPasswordController),
                            enabledBorder:
                                inputBorder(_resetPasswordController),
                            errorBorder: inputBorder(_resetPasswordController),
                            focusedErrorBorder:
                                inputBorder(_resetPasswordController)),
                        validator: (_) =>
                            _resetPasswordController.text.isEmpty ||
                                    !AuthenticationValidators.isValidEmail(
                                        _resetPasswordController.text)
                                ? S.of(context).invalidEmail
                                : null),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: Text(
                    S.of(context).resetPasswordTitle,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    onSurface: orange,
                    primary: orange,
                    elevation: 0.0,
                    padding: EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                  ),
                  onPressed: () {
                    if (_resetPasswordKey.currentState.validate()) {
                      Navigator.pop(context);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
