// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker_web/image_picker_web.dart';

class PhotoEditor extends StatefulWidget {
  final String? path;
  final Uint8List? image;
  const PhotoEditor({
    Key? key,
    this.path,
    this.image,
  }) : super(key: key);

  @override
  createState() => _PhotoEditorState();
}

class _PhotoEditorState extends State<PhotoEditor> {
  late Uint8List imageData;
  bool imgAvail = false;

  @override
  void initState() {
    super.initState();
  }

  // void loadAsset(String name) async {
  //   var data = await rootBundle.load('assets/$name');
  //   setState(() => imageData = data.buffer.asUint8List());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Editor"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.7,
                color: Colors.grey,
                child: imgAvail ? Image.memory(imageData) : Center(child: Text("No Image")),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                  onTap: () async {
                    final image = await ImagePickerWeb.getImageAsBytes();
                    setState(() {
                      imageData = image!;
                      imgAvail = true;
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 120,
                    child: Center(
                        child: Text(
                      "Upload Image",
                      style: TextStyle(color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  )),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text("Edit Image"),
                onPressed: () async {
                  var editedImage = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageEditor(
                        image: imageData,
                      ),
                    ),
                  );

                  // replace with edited image
                  if (editedImage != null) {
                    imageData = editedImage;
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
