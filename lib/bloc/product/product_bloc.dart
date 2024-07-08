import 'dart:async';
import 'package:flutter_api/bloc/product/product_event.dart';
import 'package:flutter_api/bloc/product/product_state.dart';
import 'package:flutter_api/repository/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepo productRepo = ProductRepo();
  ProductBloc() : super(const ProductState()) {
    on<ProductFetch>(fetchPost);
  }
  void fetchPost(ProductFetch event, Emitter<ProductState> emit) async {
    await productRepo.getProducts().then((onValue) {
      emit(
        state.copyWith(
            liststatus: Status.success, msg: "Success", productlist: onValue),
      );
    }).onError(
      (error, stackTrace) {
        emit(state.copyWith(liststatus: Status.error, msg: error.toString()));
      },
    );
  }
}
