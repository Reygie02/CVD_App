// ignore_for_file: camel_case_types, use_key_in_widget_constructors, unused_field, prefer_final_fields, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, depend_on_referenced_packages

import 'package:devcvd/main.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class addVideoPage extends StatefulWidget {
  @override
  State<addVideoPage> createState() => _addVideoPageState();
}

class _addVideoPageState extends State<addVideoPage> {
  CameraController _cameraController =
      CameraController(cameras.first, ResolutionPreset.medium);

  PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.2);

  int _selectedTab = 1;

  @override
  void initState() {
    super.initState();

    _cameraController.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          if (_cameraController.value.isInitialized) _buildCameraPreview(),
          Spacer(),
          Container(
            color: Colors.black,
            height: 50,
            child: _buildCameraTemplateSelector(),
          )
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    return Container(
      height: MediaQuery.of(context).size.height - 50,
      color: Colors.grey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
              scale: 1.5,
              alignment: Alignment.center,
              child: CameraPreview(_cameraController)),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 24),
                child: Row(
                  children: [
                    //close icon
                    GestureDetector(
                      onTap: () => {Navigator.pop(context)},
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [_buildButtonCamera()],
              ),
              Padding(padding: const EdgeInsets.only(bottom: 20))
            ],
          ),
        ],
      ),
    );
  }

//custom button camera
  Widget _buildButtonCamera() {
    return Column(
      children: [
        //start
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 4),
              borderRadius: BorderRadius.circular(40)),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25, //button size
          ),
        ), //end
      ],
    );
  }

  Widget _buildCameraTemplateSelector() {
    final List<String> postTypes = ["Picture", "Video", "Simulation"];
    TextStyle style = Theme.of(context).textTheme.bodyText1!.copyWith(
        fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 60,
          height: 25,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(50)),
        ),
        Container(
          height: 45,
          child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) => {
                    setState(
                      () {
                        _selectedTab = page;
                      },
                    )
                  },
              itemCount: postTypes.length,
              itemBuilder: (context, index) {
                return Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    child: Text(
                      postTypes[index],
                      style: style.copyWith(
                        color:
                            _selectedTab == index ? Colors.white : Colors.grey,
                      ),
                    ));
              }),
        ),
        Container(
          width: 50,
          height: 45,
          alignment: Alignment.bottomCenter,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 2.5,
          ),
        )
      ],
    );
  }
}
