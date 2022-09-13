// ignore_for_file: avoid_print, depend_on_referenced_packages, prefer_const_constructors, unused_element, dead_code, no_leading_underscores_for_local_identifiers, use_key_in_widget_constructors, deprecated_member_use

import 'dart:io';

import 'package:devcvd/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImagePckr extends StatefulWidget {
  @override
  State<ImagePckr> createState() => _ImagePckrState();
}

class _ImagePckrState extends State<ImagePckr> {
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
        debugShowCheckedModeBanner: false,
        home: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Scaffold(
            backgroundColor: Color.fromARGB(255, 61, 61, 61),
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => homepage()));
                },
              ),
            ),
            body: Center(
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 85, 85, 84),
                  ),
                  onPressed: () {
                    pickImage(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text("Add Image")),
            ),
          ),
        ));
  }
}
