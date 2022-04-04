import 'dart:io';
import 'dart:typed_data';
import 'package:aplikasi_scan/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:document_scanner/document_scanner.dart';
import 'package:opencv_4/factory/pathfrom.dart';
import 'package:opencv_4/opencv_4.dart';


class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {

  File? _image;
  Uint8List? _byte, salida;
  String _versionOpenCV = 'OpenCV';
  bool _visible = false;

  
  File? scannedDocument;
  Future<PermissionStatus>? cameraPermissionFuture;
  dynamic res;

  @override
  void initState() {
    cameraPermissionFuture = Permission.camera.request();
    super.initState();
  }

  testOpenCV({
    required String pathString,
    required CVPathFrom pathFrom,
    required double thresholdValue,
    required double maxThresholdValue,
    required int thresholdType,
  }) async {
    try {
      //test with threshold
      _byte = await Cv2.threshold(
        pathFrom: pathFrom,
        pathString: pathString,
        maxThresholdValue: maxThresholdValue,
        thresholdType: thresholdType,
        thresholdValue: thresholdValue,
      );

      setState(() {
        _byte;
        _visible = false;
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: purple,
            title: const Text('Scanner App'),
          ),
          body: FutureBuilder<PermissionStatus>(
            future: cameraPermissionFuture,
            builder: (BuildContext context,
                AsyncSnapshot<PermissionStatus> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data!.isGranted)
                  return Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Expanded(
                            child: scannedDocument != null
                                ? Image(image: FileImage(scannedDocument!))
                                : DocumentScanner(
                                    // documentAnimation: false,
                                    noGrayScale: false,
                                    onDocumentScanned:
                                        (ScannedImage scannedImage) {
                                      print("document : " +
                                          scannedImage.croppedImage!);

                                      setState(() {
                                        scannedDocument = scannedImage
                                            .getScannedDocumentAsFile();
                                        // imageLocation = image;
                                      });
                                    },
                                  ),
                          ),
                        ],
                      ),
                      scannedDocument != null
                          ? Positioned(
                              bottom: 20,
                              left: 0,
                              right: 0,
                              child: 
                              // RaisedButton(
                              //     color: Colors.red,
                              //     child: Text("Retry"),
                              //     onPressed: () {
                              //       setState(() {
                              //         scannedDocument = null;
                              //       });
                              //     }),
                              RaisedButton(
                                child: Text('Filter'),
                                onPressed: (){

                                },
                              ),
                            )
                          : Container(),
                    ],
                  );
                else
                  return Center(
                    child: Text("Camera permission denied"),
                  );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}