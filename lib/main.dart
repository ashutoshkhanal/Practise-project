import 'package:animal_detection/description.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyHomePage(title: 'Myapp'));
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CameraImage img;
  var isLoading = false;
  CameraController controller;
  bool isBusy = false;
  String result = "";

  final listOutputs = [];

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() => isLoading = false);
    });
  }

  iniCamera() {
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (img != null) {
        img = null;
        return;
      }
      if (!mounted) {
        return;
      }
      setState(() {
        controller.startImageStream((image) => {
              if (!isBusy) {isBusy = true, img = image, startImageLabeling()}
            });
      });
    });
  }

  @override
  Future<void> dispose() async {
    controller?.dispose();
    await Tflite.close();
    super.dispose();
  }

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
  }

  startImageLabeling() async {
    if (img != null) {
      {
        var recognitions = await Tflite.runModelOnFrame(
            bytesList: img.planes.map((plane) {
              return plane.bytes;
            }).toList(),
            // required
            imageHeight: img.height,
            imageWidth: img.width,
            imageMean: 127.5,
            // defaults to 127.5
            imageStd: 127.5,
            // defaults to 127.5
            rotation: 90,
            // defaults to 90, Android only
            numResults: 2,
            // defaults to 5
            threshold: 0.1,
            // defaults to 0.1
            asynch: true // defaults to true
            );
        result = "";

        recognitions.forEach((re) {
          result += re['label'] +
              ": " +
              (re['confidence'] as double).toStringAsFixed(2) +
              "\n";
        });
        setState(() {
          // ignore: unnecessary_statements
          result = result;
        });
        isBusy = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text('Animal Detection Application'),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              iniCamera();
            },
            label: const Text('Video'),
            icon: const Icon(Icons.videocam),
            backgroundColor: Colors.orange,
          ),
          body: Container(
            child: img == null
                ? null
                : Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Container(
                              //margin: EdgeInsets.only(top: 118),
                              height: 320,
                              width: 320,
                              child: AspectRatio(
                                aspectRatio: controller.value.aspectRatio,
                                child: CameraPreview(controller),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          // margin: EdgeInsets.only(top: 50),
                          child: SingleChildScrollView(
                              child: TextButton(
                            child: img == null
                                ? null
                                : Text(
                                    "${listOutputs[0]['label'].substring(2)} : ${(listOutputs[0]['confidence'] * 100).toStringAsFixed(1)} %",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontFamily: 'finger_paint'),
                                    textAlign: TextAlign.center,
                                  ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Description()),
                              );
                            },
                          )),
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          'Sound',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
