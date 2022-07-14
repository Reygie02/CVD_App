import 'package:flutter/material.dart';

class TritanopiaFillPage extends StatelessWidget {
  static const Tritanopia = "TritanopiaCam";

  const TritanopiaFillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is TritanCam Section"),
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
