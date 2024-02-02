import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';

class ParametersView extends StatelessWidget {
  const ParametersView({
    super.key,
    required this.body,
    required this.onChanged,
    required this.controller,
  });

  final String body;
  final Function(String) onChanged;
  final CodeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Parameters",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.8,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Flexible(
            child: CodeTheme(
              data: CodeThemeData(styles: a11yDarkTheme),
              child: CodeField(
                onChanged: onChanged,
                gutterStyle: GutterStyle.none,
                controller: controller,
                expands: true,
                wrap: true,
                textStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
