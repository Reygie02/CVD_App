/// A function that is used to navigate to the next page.

// ignore_for_file: avoid_print, unnecessary_this

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

// import 'Camexam.dart'; // for example of camera picker

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //disable auto rotate screen

  runApp(const HomePage());
}

// ignore: camel_case_types
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

// ignore: camel_case_types
class _HomePageState extends State<HomePage> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      await ImagePicker().pickImage(source: source);
      if (image == null) return;
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
    return MaterialApp(
        debugShowCheckedModeBanner: false, // debug hastag
        home: Scaffold(
          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color.fromARGB(255, 243, 168, 5),
                    Color.fromARGB(255, 50, 121, 228),
                    Color.fromARGB(255, 160, 15, 165)
                  ])), // background

              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                        primary: const Color.fromARGB(199, 248, 4, 138),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      onPressed: () {
                        pickImage(ImageSource.camera);
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
                        primary: const Color.fromARGB(214, 243, 168, 5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      onPressed: () {
                        pickImage(ImageSource.gallery);

                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) =>
                        //         const openCv())); // for example of camera picker
                      },
                      label: const Text("Gallery"),
                      icon: const Icon(Icons.image),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
