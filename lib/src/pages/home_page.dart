// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, depend_on_referenced_packages, unnecessary_const, avoid_print, prefer_const_constructors
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:devcvd/src/shared/authentication/terms_of_use.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagePermanent = await saveImagePermanently(image!.path);
      setState(() => image = imagePermanent);
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
                        pickImage(ImageSource.camera);

                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const campage()));
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
                        primary: Color.fromARGB(255, 243, 168, 5),
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
