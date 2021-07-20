import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/shared/px2dpx.dart';
import 'package:internship_project_1/shared/regex.dart';

class VerificationCodeScreen extends StatelessWidget {
  static const String id = 'verification_code_screen';

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
      body: VerificationCodeForm(),
    );
  }
}

class VerificationCodeForm extends StatefulWidget {
  @override
  _VerificationCodeFormState createState() => _VerificationCodeFormState();
}

class _VerificationCodeFormState extends State<VerificationCodeForm> {
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
              S.of(context).verificationCodeTitle,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Text(
              S.of(context).verificationCodeSubtitle,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).verificationCodeNullWarning;
                }
                if (!verificationCodeFormat.hasMatch(value)) {
                  return S.of(context).verificationCodeInvalidWarning;
                }
                return null;
              },
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.pushNamed(context, 'new_password_screen');
                  }
                },
                child: Text(S.of(context).confirmBtnText.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
