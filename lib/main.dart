/// A function that is used to navigate to the next page.
import 'package:devcvd/DeuternomallyFill.dart';
import 'package:devcvd/TritonopiaFill.dart';
import 'package:flutter/material.dart';
import 'ProtonopiaFill.dart';
import 'TritonopiaFill.dart';
import 'DeuternomallyFill.dart';

void main() => runApp(const Myapp());

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // debug hastag
      home: const btncam(),
      routes: {
        ProtonFillPage.Protonopia: ((_) => ProtonFillPage()),
        TritanopiaFillPage.Tritanopia: ((_) => const TritanopiaFillPage()),
        DeuternFillPage.Deuternomaly: ((_) => DeuternFillPage()) //end
      },
    );
  }
}

// ignore: camel_case_types
class btncam extends StatefulWidget {
  const btncam({Key? key}) : super(key: key);

  @override
  State<btncam> createState() => _btncamState();
}

// ignore: camel_case_types
class _btncamState extends State<btncam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 243, 168, 5),
              Color.fromARGB(255, 50, 121, 228),
              Color.fromARGB(255, 160, 15, 165)
            ])), // background

        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Choose Filter Mode",
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
              const SizedBox(
                height: 100,
              ),

              //button
              ElevatedButton.icon(
                //for proton filter
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(180, 60),
                  textStyle: const TextStyle(fontSize: 35),
                  primary: Color.fromARGB(158, 13, 207, 255),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(ProtonFillPage.Protonopia);
                },
                label: const Text("Protonopia"),
                icon: const Icon(Icons.image),
              ),
              const SizedBox(height: 20),

              ElevatedButton.icon(
                //for Tritanopia filter
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(180, 60),
                  textStyle: const TextStyle(fontSize: 35),
                  primary: Color.fromARGB(158, 13, 207, 255),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 45),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),

                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(TritanopiaFillPage.Tritanopia);
                },
                label: const Text("Tritanopia"),
                icon: const Icon(Icons.image),
              ),
              const SizedBox(height: 20),

              ElevatedButton.icon(
                //for Deuternomaly filter
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(180, 60),
                  textStyle: const TextStyle(fontSize: 35),
                  primary: Color.fromARGB(158, 13, 207, 255),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(DeuternFillPage.Deuternomaly);
                },
                label: const Text("Deuternomaly"),
                icon: const Icon(Icons.image),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
