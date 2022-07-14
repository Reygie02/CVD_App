import 'package:flutter/material.dart';

class DeuternFillPage extends StatelessWidget {
  static const Deuternomaly = "DeuternCam";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is DeuternCam Section"),
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
