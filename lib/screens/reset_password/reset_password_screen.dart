import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/shared/px2dpx.dart';
import 'package:internship_project_1/shared/regex.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String id = 'reset_password_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ResetPasswordForm(),
    );
  }
}

class ResetPasswordForm extends StatefulWidget {
  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(convertPx2Dpx(context, 15.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).resetPasswordTitle,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Text(
              S.of(context).resetPasswordSubtitle,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).resetPasswordNullWarning;
                }
                if (!phoneFormat.hasMatch(value)) {
                  return S.of(context).resetPasswordInvalidWarning;
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.pushNamed(context, 'verification_code_screen');
                  }
                },
                child: Text(S.of(context).sendBtnText.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
