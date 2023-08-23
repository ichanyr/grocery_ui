part of 'product_bloc.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<Product> products; //variable product tipe data List<Product>
  ProductSuccess({
    required this.products, //constructor
  });
}
