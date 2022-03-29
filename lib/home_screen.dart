import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color currentColor = Colors.limeAccent;
  Color pickerColor = const Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: const Text('Pick a color!'),
                          content: SingleChildScrollView(
                              child: ColorPicker(
                            pickerColor: currentColor,
                            onColorChanged: changeColor,
                            enableAlpha: true,
                            displayThumbColor: true,
                          )));
                    });
              },
              child: const Text(
                "change me",
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(pickerColor),
              ),
            ),
          )),
    );
  }
}
