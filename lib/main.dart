import 'dart:html';

import 'package:flutter/material.dart';
import 'package:gmail_ui/tool_bar.dart';

import 'app_bar.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Start(),
  ));
}

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {

  double width_ = 200;

  String language_selected = 'English(US)';
  String country_selected = "India";

  // List of items in our dropdown menu
  var languages = [
    "English(US)",
    "English(UK)",
    "French",
    "Spanish"
  ];

  var countries = [
    "India",
    "USA",
    "UK",
    "France"
  ];

  String _selectedTextStyle = 'Normal';
  double _selectedFontSize = 16.0;
  final TextEditingController _textEditingController = TextEditingController();

  final Map<String, TextStyle> _textStyles = {
    'Normal': const TextStyle(fontSize: 16.0, color: Colors.black),
    'Bold': const TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    'Italic': const TextStyle(fontSize: 16.0, color: Colors.black, fontStyle: FontStyle.italic),
    'Underline': const TextStyle(fontSize: 16.0, color: Colors.black, decoration: TextDecoration.underline),
  };

  final Map<String, double> _fontSizes = {
    'Small': 12.0,
    'Medium': 16.0,
    'Large': 20.0,
    'Huge': 24.0,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Container(

          margin: const EdgeInsets.all(5),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),

          clipBehavior: Clip.hardEdge,

          child: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              app_bar(),

              tool_bar(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                          width: width_,
                          child: const Text(
                            "Language:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("General display language:"),
                                  ),
                                  DropdownButton(

                                    borderRadius: BorderRadius.circular(10),

                                    value: language_selected,

                                    icon: const Icon(Icons.keyboard_arrow_down),

                                    items: languages.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),

                                    onChanged: (String? newValue) {
                                      setState(() {
                                        language_selected = newValue!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Change language settings for other Google products\nShow all language options",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              )

                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),

              const Divider(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                          width: width_,
                          child: const Text(
                            "Phone numbers:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                      Container(
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Default country codes:"),
                              ),
                              DropdownButton(

                                borderRadius: BorderRadius.circular(10),

                                value: country_selected,

                                icon: const Icon(Icons.keyboard_arrow_down),

                                items: countries.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),

                                onChanged: (String? newValue) {
                                  setState(() {
                                    country_selected = newValue!;
                                  });
                                },
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),

              const Divider(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                          width: width_,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Default text style:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Text("(Use the 'Remove formatting' button on the toolbar to reset the default text style)")
                            ],
                          )
                      ),
                      Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          DropdownButton<String>(
                                            value: _selectedTextStyle,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedTextStyle = newValue!;
                                              });
                                            },
                                            items: _textStyles.keys.map((style) {
                                              return DropdownMenuItem<String>(
                                                value: style,
                                                child: Text(style),
                                              );
                                            }).toList(),
                                          ),
                                          const SizedBox(width: 20.0),
                                          DropdownButton<double>(
                                            value: _selectedFontSize,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedFontSize = newValue!;
                                              });
                                            },
                                            items: _fontSizes.keys.map((size) {
                                              return DropdownMenuItem<double>(
                                                value: _fontSizes[size],
                                                child: Text(size),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),

                                      Text(
                                        "This is what your body text will look like.",
                                        style: _textStyles[_selectedTextStyle]?.copyWith(fontSize: _selectedFontSize),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),

              const Divider(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                          width: width_,
                          child: const Text(
                            "Stars:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width - 250,
                                      child: const Text("Drag the stars between the lists.  The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      child: const Text("In use:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    const Icon(Icons.star, color: Colors.yellow,)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      child: const Text("Not in use:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    const Icon(Icons.star, color: Colors.orange,),
                                    const Icon(Icons.star, color: Colors.red,),
                                    const Icon(Icons.star, color: Colors.purple,),
                                    const Icon(Icons.star, color: Colors.blue,),
                                    const Icon(Icons.star, color: Colors.green,),
                                    const SizedBox(width: 5,),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: const Center(child: Text("!",style: TextStyle(fontWeight: FontWeight.bold))),
                                    ),
                                    const SizedBox(width: 7,),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: const Center(child: Text(">>",style: TextStyle(fontWeight: FontWeight.bold))),
                                    ),
                                    const SizedBox(width: 7,),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: const Center(child: Text("!",style: TextStyle(fontWeight: FontWeight.bold))),
                                    ),
                                    const SizedBox(width: 7,),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: const Center(child: Text("✔",style: TextStyle(fontWeight: FontWeight.bold))),
                                    ),
                                    const SizedBox(width: 7,),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: const Center(child: Text("i",style: TextStyle(fontWeight: FontWeight.bold))),
                                    ),
                                    const SizedBox(width: 7,),
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: const Center(child: Text("?",style: TextStyle(fontWeight: FontWeight.bold),)),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),

              const Divider(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  child: Row(
                    children: [
                      Container(
                          width: width_,
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              const Text(
                                "Signatures:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Text(
                                "(appended at the end of all outgoing messages)",
                              )
                            ],
                          )
                      ),
                      Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 170,
                                    child: Row(
                                      children: [
                                        const Text("My signature"),
                                        const Spacer(),
                                        const Icon(Icons.edit, size: 17,),
                                        const SizedBox(width: 2,),
                                        const Icon(Icons.delete, size: 17,)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black.withOpacity(.7), width: 0.7),
                                  borderRadius: BorderRadius.circular(3)
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("+ Create Signature", style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16
                                  ),),
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

