import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_5/features/product/domain/entities/product_entity.dart';
import 'package:image_picker/image_picker.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required String id,
      required String name, required String description, required int price, required File? imagePath,
      
    }) : super(id:id, name:  name, description: description, price: price, imagePath: imagePath);

    


  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id : json['id'],// TO be deleteed
      name: json['name'],
      description: json['description'],
      price: int.parse(json['price']),
      imagePath: json['imageUrl'],
    );
  }

  Map<String, String> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price.toString(),
      'description': description,
      'imagePath': imagePath.toString(),
    };
  }
  
}
