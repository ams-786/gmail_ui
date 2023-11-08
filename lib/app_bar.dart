import 'package:flutter/material.dart';

Widget app_bar() {
  return Container(
    height: 50,
    decoration: BoxDecoration(
        color: Colors.grey.shade500
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Settings",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    ),
  );
}