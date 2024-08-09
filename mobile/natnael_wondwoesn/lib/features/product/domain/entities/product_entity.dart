import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final String description;
  final num price;
  final String imagePath;
  const ProductEntity(
      {
      required this.name,
      required this.description,
      required this.price,
      required this.imagePath});

  @override
  List<Object?> get props => [name, description, price,imagePath];
}

var new_entity = ProductEntity( name: 'name', description: 'description', price: 1.0,imagePath: 'imagePath');