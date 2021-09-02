import 'dart:io';

import 'package:get/get.dart';
import 'package:great_place/models/place.dart';
import 'package:image_picker/image_picker.dart';

class GreatPlace extends GetxController {
  RxList<Place> _itmes = RxList();

  List<Place> get items {
    return [..._itmes];
  }

  void addPlace(String title, XFile image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        loctaion: null,
        image: image);
    // itmes.add(newPlace);
    _itmes.add(newPlace);
    update();
    print('items:' + items.length.toString());
  }
}
