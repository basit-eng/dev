import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {}

class ProductFetch extends ProductEvent {
  @override
  List<Object?> get props => [];
}
