// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'ProtonopiaFill.dart';
import 'TritonopiaFill.dart';
import 'DeuternomallyFill.dart';
import 'main.dart';

class imgfilter extends StatefulWidget {
  imgfilter({Key? key}) : super(key: key);
  static const imgfiltermode = "imgfilter";

  @override
  State<imgfilter> createState() => _imgfilterState();
}

class _imgfilterState extends State<imgfilter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: imgmode(),
      routes: {
        ProtonFillPage.Protonopia: ((_) => const ProtonFillPage()),
        TritanopiaFillPage.Tritanopia: ((_) => const TritanopiaFillPage()),
        DeuternFillPage.Deuternomaly: ((_) => const DeuternFillPage())
      },
    );
  }
}

class imgmode extends StatefulWidget {
  imgmode({Key? key}) : super(key: key);

  @override
  State<imgmode> createState() => _imgmodeState();
}

class _imgmodeState extends State<imgmode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Choose Image Filter ",
          style: TextStyle(fontSize: 26),
        ),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Myapp()));
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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

        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //button
              ElevatedButton.icon(
                //for proton filter
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(180, 60),
                  textStyle: const TextStyle(fontSize: 35),
                  primary: const Color.fromARGB(158, 13, 207, 255),
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(ProtonFillPage.Protonopia);
                },
                label: const Text("Protonopia"),
                icon: const Icon(Icons.filter_1_rounded),
              ),
              const SizedBox(height: 20),

              ElevatedButton.icon(
                //for Tritanopia filter
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(180, 60),
                  textStyle: const TextStyle(fontSize: 35),
                  primary: const Color.fromARGB(158, 13, 207, 255),
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 45),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),

                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(TritanopiaFillPage.Tritanopia);
                },
                label: const Text("Tritanopia"),
                icon: const Icon(Icons.filter_2_rounded),
              ),
              const SizedBox(height: 20),

              ElevatedButton.icon(
                //for Deuternomaly filter
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(180, 60),
                  textStyle: const TextStyle(fontSize: 35),
                  primary: const Color.fromARGB(158, 13, 207, 255),
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(DeuternFillPage.Deuternomaly);
                },
                label: const Text("Deuternomaly"),
                icon: const Icon(Icons.filter_3_rounded),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}