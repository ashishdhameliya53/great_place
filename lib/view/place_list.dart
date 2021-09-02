import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_place/controller/place_controller.dart';
import 'package:great_place/view/add_place.dart';
import 'package:image_picker/image_picker.dart';

class PlaceList extends StatelessWidget {
  GreatPlace greatPlace = Get.put(GreatPlace());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Place'),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(AddPlace());
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
          children: [
            GetBuilder<GreatPlace>(
              builder: (add) => add.items.length <= 0
                  ? Center(
                      child: Text('please add data'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: greatPlace.items.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          title: Text(greatPlace.items[index].title
                              .toString()
                              .toUpperCase()),
                          // leading: Image.file(File(greatPlace.items[index].image!.path)),
                        );
                      },
                    ),
            )
          ],
        ));
  }
}
