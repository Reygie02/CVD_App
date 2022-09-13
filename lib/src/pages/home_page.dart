// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, depend_on_referenced_packages, unnecessary_const, avoid_print, prefer_const_constructors, unused_import, deprecated_member_use

import 'package:devcvd/src/pages/camera_page.dart';
import 'package:flutter/material.dart';
import 'package:devcvd/src/shared/authentication/terms_of_use.dart';
import 'package:devcvd/src/pages/imagepicker.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // debug hastag
        home: Scaffold(
          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF701ebd),
                      Color(0xFF837bcc),
                      Color(0xFFfe4a97),
                      Color(0xFFe17763),
                      Color(0xFF68998c)
                    ]),
              ),
              // background

              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    const Image(
                      image: const AssetImage('assets/splash.png'),
                      width: 160,
                      height: 140,
                    ),
                    const SizedBox(
                      height: 100,
                    ),

                    //button
                    ElevatedButton.icon(
                      //for camera filter
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(180, 60),
                          textStyle: const TextStyle(fontSize: 35),
                          primary: Color.fromARGB(255, 248, 28, 4),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          shadowColor: const Color.fromARGB(255, 0, 0, 0)),

                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => addVideoPage()));
                      },
                      label: const Text("Live"),
                      icon: const Icon(Icons.camera),
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton.icon(
                      //for image filter

                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(180, 60),
                        textStyle: const TextStyle(fontSize: 35),
                        primary: Color.fromARGB(255, 243, 168, 5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ImagePckr()));
                      },
                      label: const Text("Image"),
                      icon: const Icon(Icons.image),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    TermsOfUse(),
                  ],
                ),
              ]),
              //
            ),
          ),
        ));
  }
}
