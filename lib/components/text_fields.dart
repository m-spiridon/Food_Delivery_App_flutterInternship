import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/shared/input_border.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  final state;

  EmailTextField(this.state, {this.emailController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(S.of(context).email,
              style: TextStyle(
                  color:
                      emailController.text.isEmpty ? Colors.grey : Colors.black,
                  height: 1.5)),
        ),
        TextFormField(
            controller: emailController,
            cursorColor:
                emailController.text.isEmpty ? Colors.grey : Colors.black,
            decoration: InputDecoration(
                focusedBorder: inputBorder(emailController),
                enabledBorder: inputBorder(emailController),
                errorBorder: inputBorder(emailController),
                focusedErrorBorder: inputBorder(emailController)),
            autovalidateMode: AutovalidateMode.disabled,
            validator: (_) =>
                !state.isEmailValid || emailController.text == null
                    ? S.of(context).invalidEmail
                    : null),
      ],
    );
  }
}

class PostCodeTextField extends StatelessWidget {
  final TextEditingController postCodeController;

  PostCodeTextField({this.postCodeController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(S.of(context).postcode,
              style: TextStyle(
                  color: postCodeController.text.isEmpty
                      ? Colors.grey
                      : Colors.black,
                  height: 1.5)),
        ),
        TextFormField(
            controller: postCodeController,
            cursorColor:
                postCodeController.text.isEmpty ? Colors.grey : Colors.black,
            decoration: InputDecoration(
                focusedBorder: inputBorder(postCodeController),
                enabledBorder: inputBorder(postCodeController),
                errorBorder: inputBorder(postCodeController),
                focusedErrorBorder: inputBorder(postCodeController)),
            validator: (_) => postCodeController.text == null
                ? S.of(context).validPostCode
                : null),
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController passwordController;
  final state;

  PasswordTextField(this.state, {this.passwordController});
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(S.of(context).password,
              style: TextStyle(
                  color: widget.passwordController.text.isEmpty
                      ? Colors.grey
                      : Colors.black)),
        ),
        TextFormField(
          controller: widget.passwordController,
          cursorColor: widget.passwordController.text.isEmpty
              ? Colors.grey
              : Colors.black,
          autofocus: false,
          obscureText: hidePassword,
          decoration: InputDecoration(
            suffixIcon: widget.passwordController.text.isNotEmpty
                ? InkWell(
                    onTap: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    child: hidePassword
                        ? Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Image(
                                height: 20.0,
                                width: 20.0,
                                image: AssetImage('images/hide.png')),
                          )
                        : Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.black,
                            size: 32.0,
                          ),
                  )
                : null,
            errorMaxLines: 2,
            focusedBorder: inputBorder(widget.passwordController),
            enabledBorder: inputBorder(widget.passwordController),
            errorBorder: inputBorder(widget.passwordController),
            focusedErrorBorder: inputBorder(widget.passwordController),
          ),
          autovalidateMode: AutovalidateMode.disabled,
          validator: (_) {
            return !widget.state.isPasswordValid ||
                    widget.passwordController.text == null
                ? S.of(context).invalidPassword
                : null;
          },
        ),
      ],
    );
  }
}
