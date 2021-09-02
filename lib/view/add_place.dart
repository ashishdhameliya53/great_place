import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_place/controller/place_controller.dart';
import 'package:great_place/widgets/image_input.dart';
import 'package:image_picker/image_picker.dart';

class AddPlace extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  var _pickedImage;
  Future _selectImage(var pickedImage) async {
    _pickedImage = pickedImage;
  }

  GreatPlace greatPlace = Get.put(GreatPlace());

  void _savePlace() {
    if (titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        label: Text('Title'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(onselectImage: _selectImage),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey[800])),
                onPressed: () {
                  _savePlace();
                  // print('okk');
              greatPlace.addPlace(titleController.text, _pickedImage);
              
                  Get.back();
                },
                icon: Icon(Icons.add),
                label: Text('Add')),
          ),
        ],
      ),
    );
  }
}
