import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  Function? onselectImage;
  ImageInput({this.onselectImage});

  @override
  _ImageInputState createState() => _ImageInputState();
}

XFile? _storedImage;

class _ImageInputState extends State<ImageInput> {
  Future<void> _takePicture() async {
    ImagePicker image = ImagePicker();
    final imageFile =
        await image.pickImage(source: ImageSource.camera, maxWidth: 600);
    // print(imageFile!.path);
    setState(() {
      _storedImage = imageFile;
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = basename(imageFile!.path);
   final savedImage =  XFile('${appDir.path}/$fileName');
    print(savedImage.toString());

     widget.onselectImage!(savedImage);  
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * 0.4,
          height: size.height * 0.2,
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
          )),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  File(_storedImage!.path),
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Text('No Image Taken'),
        ),
        SizedBox(width: 50),
        TextButton.icon(
          onPressed: () {
            // print('object');
            _takePicture();
            // _takImage;
          },
          icon: Icon(
            Icons.camera,
            color: Colors.blueGrey[700],
          ),
          label: Text('Take A Picture',
              style: TextStyle(
                  color: Colors.blueGrey[700], fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
