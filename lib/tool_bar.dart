import 'package:flutter/material.dart';

Widget tool_bar() {
  return Container(
    color: Colors.grey.shade300,
    child: Row(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("General"),
        ),
      ],
    ),
  );
}