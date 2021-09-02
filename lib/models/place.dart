import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';


class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;
  PlaceLocation(
    @required  this.latitude,
    @required this.longitude,
    this.address,
  );


}

class Place {
  final String? id;
  final String? title;
  final PlaceLocation? loctaion;
  final XFile? image;  

  Place({
    required this.id,
    required this.title,
   this.loctaion,
    required this.image,
  });
}
