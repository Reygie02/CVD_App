// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DeuternFillPage extends StatelessWidget {
  // ignore: constant_identifier_names
  static const Deuternomaly = "DeuternCam";

  const DeuternFillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("This is DeuternCam Section"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 243, 168, 5),
              Color.fromARGB(255, 50, 121, 228),
              Color.fromARGB(255, 160, 15, 165)
            ])), // background

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera),
              ],
            )
          ],
        ),
      ),
    );
  }
}
