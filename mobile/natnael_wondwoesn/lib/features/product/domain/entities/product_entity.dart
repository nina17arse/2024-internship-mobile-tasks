import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final num price;

  const ProductEntity(
      {required this.id,
      required this.name,
      required this.description,
      required this.price});

  @override
  List<Object?> get props => [id, name, description, price];
}

var new_entity = ProductEntity(id: '1', name: 'name', description: 'description', price: 1.0);