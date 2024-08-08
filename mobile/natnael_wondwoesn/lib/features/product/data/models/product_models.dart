import 'package:flutter/foundation.dart';
import 'package:flutter_application_5/features/product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required String id,
    required String name, required String description, required int price, required String imagePath,
    
  }) : super(id: id, name: name, description: description, price: price, imagePath: imagePath);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imagePath: json['imageUrl'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'imagePath': imagePath,
    };
  }
  
}
