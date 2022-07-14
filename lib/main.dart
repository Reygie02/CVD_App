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
      appBar: AppBar(
          //title: Text(""),

          ),
      body: Container(
        color: Colors.white, // background
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Choose Filtering Mode",
                style: TextStyle(fontSize: 35),
              ),
              const SizedBox(
                height: 200,
              ),

              //button
              ElevatedButton.icon(
                //for proton filter
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(180, 60),
                    textStyle: const TextStyle(fontSize: 35),
                    primary: Colors.lightBlue),
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
                    primary: Colors.lightBlue),
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
                    primary: Colors.lightBlue),
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
