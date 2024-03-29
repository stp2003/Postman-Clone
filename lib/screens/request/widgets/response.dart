import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';
import 'package:highlight/languages/json.dart' show json;

class ResponseView extends StatelessWidget {
  const ResponseView({
    super.key,
    required this.response,
  });

  final String response;

  @override
  Widget build(BuildContext context) {
    String responseString = '';

    try {
      Map jsonData = jsonDecode(response.toString());

      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      String prettyprint = encoder.convert(jsonData);
      responseString = prettyprint;
    } catch (e) {
      //
    }

    final controller = CodeController(
      text: responseString,
      language: json,
    );

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
              "Response",
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
                gutterStyle: GutterStyle.none,
                controller: controller,
                expands: true,
                readOnly: true,
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
