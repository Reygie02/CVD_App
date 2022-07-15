// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DeuternFillPage extends StatelessWidget {
  // ignore: constant_identifier_names
  static const Deuternomaly = "DeuternCam";

  const DeuternFillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(180, 60),
                      textStyle: const TextStyle(fontSize: 35),
                      primary: const Color.fromARGB(158, 13, 207, 255),
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.camera_enhance),
                    label: const Text("Capture")),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(180, 60),
                      textStyle: const TextStyle(fontSize: 35),
                      primary: const Color.fromARGB(158, 13, 207, 255),
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.image),
                    label: const Text("Image")),
                const SizedBox(height: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
