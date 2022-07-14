import 'package:flutter/material.dart';

class ProtonFillPage extends StatelessWidget {
  static const Protonopia = "ProtonCam";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is protonCam Section"),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.camera,
                  size: 150,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
