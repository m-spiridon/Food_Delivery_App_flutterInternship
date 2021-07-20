import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';

class RecipeInstruction extends StatelessWidget {
  final recipeInstructions;

  RecipeInstruction({this.recipeInstructions});
  @override
  Widget build(BuildContext context) {
    final instructions = recipeInstructions.toString().replaceAll("\\n", "\n");
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(S.of(context).recipeInstructions,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w700)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          // markdown text example
          child: Markdown(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            data: '$instructions',
            styleSheet: MarkdownStyleSheet.fromTheme(
              ThemeData(
                textTheme: TextTheme(
                  bodyText2: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
