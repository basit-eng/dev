import 'package:equatable/equatable.dart';
import 'package:flutter_api/model/products_model.dart';

enum Status { loading, success, error }

class ProductState extends Equatable {
  final List<ProductsModel> productlist;
  final status;
  final String msg;
  const ProductState(
      {this.productlist = const [],
      this.status = Status.loading,
      this.msg = ''});

  ProductState copyWith(
      {List<ProductsModel>? productlist, Status? liststatus, String? msg}) {
    return ProductState(
      productlist: productlist ?? this.productlist,
      status: liststatus ?? this.status,
      msg: msg ?? this.msg,
    );
  }

  @override
  List<Object> get props => [productlist, status, msg];
}

// /// Initialized
// class LoadingProductState extends ProductState {
//   final ProductsModel productsModel;
//   final status;

//   @override
//   List<Object> get props => [productsModel, status];
// }

// /// Loaded Product State
// class LoadedProductState extends ProductState {
//   LoadedProductState(this.hello);

//   final String hello;

//   @override
//   String toString() => 'InProductState $hello';

//   @override
//   List<Object> get props => [hello];
// }

// class ErrorProductState extends ProductState {
//   ErrorProductState(this.errorMessage);

//   final String errorMessage;

//   @override
//   String toString() => 'ErrorProductState';

//   @override
//   List<Object> get props => [errorMessage];
// }
