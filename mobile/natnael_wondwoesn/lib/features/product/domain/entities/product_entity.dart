import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final num price;
  final String imagePath;
  const ProductEntity(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imagePath});

  @override
  List<Object?> get props => [id, name, description, price,imagePath];
}

var new_entity = ProductEntity(id: '1', name: 'name', description: 'description', price: 1.0,imagePath: 'imagePath');