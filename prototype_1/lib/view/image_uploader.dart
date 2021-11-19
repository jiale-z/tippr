import 'package:flutter/material.dart';
import './home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

enum ImageSourceType { gallery, camera }

class ServerPageCopy extends StatefulWidget {
  @override
  _ServerPageCopyState createState() => _ServerPageCopyState();

  // const AuthPage({
  //   Key? key,
  //   required this.data,
  // }) : super(key: key);
}

class _ServerPageCopyState extends State<ServerPageCopy> {
  @override
  void initState() {
    super.initState();
    // Provider.of<HomeViewModel>(context, listen: false).fetchUserData();
  }

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => ImageFromGalleryEx(type)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Your Profile Image"),
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: Text(
                      'Upload Your Profile Image',
                      style: TextStyle(fontSize: 50),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.125,
                  width: MediaQuery.of(context).size.width * 1,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: Text(
                      "Pick Image from Gallery",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    onPressed: () {
                      _handleURLButtonPress(context, ImageSourceType.gallery);
                    },
                  ),
                ),
              ),
              // MaterialButton(
              //   color: Colors.blue,
              //   child: Text(
              //     "Pick Image from Gallery",
              //     style: TextStyle(
              //         color: Colors.white70, fontWeight: FontWeight.bold),
              //   ),
              //   onPressed: () {
              //     _handleURLButtonPress(context, ImageSourceType.gallery);
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.125,
                  width: MediaQuery.of(context).size.width * 1,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    child: Text(
                      "Pick Image from Camera",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    onPressed: () {
                      _handleURLButtonPress(context, ImageSourceType.camera);
                    },
                  ),
                ),
              ),
              // MaterialButton(
              //   color: Colors.blue,
              //   child: Text(
              //     "Pick Image from Camera",
              //     style: TextStyle(
              //         color: Colors.white70, fontWeight: FontWeight.bold),
              //   ),
              //   onPressed: () {
              //     _handleURLButtonPress(context, ImageSourceType.camera);
              //   },
              // ),
            ],
          ),
        ));
  }
}

class ImageFromGalleryEx extends StatefulWidget {
  final type;
  ImageFromGalleryEx(this.type);

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState(this.type);
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  var _image;
  var imagePicker;
  var type;

  ImageFromGalleryExState(this.type);

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(type == ImageSourceType.camera
              ? "Image from Camera"
              : "Image from Gallery")),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 52,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                var source = type == ImageSourceType.camera
                    ? ImageSource.camera
                    : ImageSource.gallery;
                XFile image = await imagePicker.pickImage(
                    source: source,
                    imageQuality: 50,
                    preferredCameraDevice: CameraDevice.front);
                setState(() {
                  _image = File(image.path);
                });
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(color: Colors.red[200]),
                child: _image != null
                    ? Image.file(
                        _image,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.fitHeight,
                      )
                    : Container(
                        decoration: BoxDecoration(color: Colors.red[200]),
                        width: 200,
                        height: 200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.125,
              width: MediaQuery.of(context).size.width * 1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                onPressed: () {
                  continue_home();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  continue_home() {
    //call viewmodel here

    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
  }
}
