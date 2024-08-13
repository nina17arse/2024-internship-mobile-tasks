import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_5/features/product/presentation/bloc/home_event.dart';
import 'package:flutter_application_5/features/product/presentation/bloc/home_state.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_5/features/product/data/models/product_models.dart';
import 'package:flutter_application_5/features/product/domain/usecases/get_detail_usecase.dart';
import 'package:flutter_application_5/features/product/domain/usecases/delete_usecase.dart';
import 'package:flutter_application_5/features/product/domain/usecases/update_usecase.dart';
import 'package:flutter_application_5/features/product/domain/usecases/add_usecase.dart';

import '../../../../core/usecases/usecases.dart';
import '../../domain/usecases/get_all_usecase.dart';




class HomeBloc extends Bloc<HomeEvent, HomeState> {
   late GetAllUsecase getAllProductsUseCase;
   late GetDetailUseCase getDetailUsecase;
  HomeBloc() : super(HomeLoading()) {
    on<GetProductsEvent>((event, emit) async{
      emit(HomeLoading());
      var products = await getAllProductsUseCase(NoParams());
      products.fold((l) => emit(HomeFailure(l.message)), (r) => emit(HomeLoaded(r)));

    });
  }
}
