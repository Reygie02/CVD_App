/// A function that is used to navigate to the next page.

// ignore_for_file: avoid_print, unnecessary_this

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'Filtermode.dart'; // package for filter mode
// import 'imageFilter.dart';// package for filter mode

// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

void main() => runApp(const Myapp());

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // debug hastag
      home: btncam(),
      routes: {
        // Filter.filtermode: ((_) => Filter()),// to call filter page example
        // imgfilter.imgfiltermode: ((_) => imgfilter()), // to call filter page example
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
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // final imageTemporary = File(image!.path);
      final imagePermanent = await saveImagePermanently(image!.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      print('Failed to pick Image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('$directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
              const Text(
                "this is CVD camera application",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(
                height: 100,
              ),

              //button

              const SizedBox(height: 20),
              ElevatedButton.icon(
                //for camera filter
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(180, 60),
                  textStyle: const TextStyle(fontSize: 35),
                  primary: const Color.fromARGB(255, 248, 4, 138),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onPressed: () {
                  pickImage(ImageSource.camera);
                  // Navigator.of(context).pushNamed(Filter.filtermode); // for filter page example only
                },
                label: const Text("Camera"),
                icon: const Icon(Icons.camera),
              ),
              const SizedBox(height: 20),

              ElevatedButton.icon(
                //for image filter
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(180, 60),
                  textStyle: const TextStyle(fontSize: 35),
                  primary: const Color.fromARGB(255, 243, 168, 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                onPressed: () {
                  pickImage(ImageSource.gallery);
                  // Navigator.of(context).pushNamed(imgfilter.imgfiltermode);// for filter page example only
                },
                label: const Text("Gallery"),
                icon: const Icon(Icons.image),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
