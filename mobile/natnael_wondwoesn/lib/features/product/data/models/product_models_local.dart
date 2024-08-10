import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_5/features/product/domain/entities/product_entity.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/product_entity_local.dart';

class ProductModel_Local extends ProductEntity_Local {
  const ProductModel_Local({
    // required String id,
      required String name, required String description, required int price, required File? imagePath,
      
    }) : super(name:  name, description: description, price: price, imagePath: imagePath);

    Future<File?> _pickImage() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}


  factory ProductModel_Local.fromJson(Map<String, dynamic> json) {
    return ProductModel_Local(
        // TO be deleteed
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imagePath: json['imageUrl'],
    );
  }

  Map<String, String> toJson() {
    return {
      'name': name,
      'price': price.toString(),
      'description': description,
      // 'imagePath': imagePath,
    };
  }
  
}