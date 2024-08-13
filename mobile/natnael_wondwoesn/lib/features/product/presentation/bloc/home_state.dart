import 'package:equatable/equatable.dart';

import '../../data/models/product_models.dart';
import '../../domain/entities/product_entity.dart';


// part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  final List<ProductEntity> products;

  HomeLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);

  @override
  List<Object> get props => [message];
}
