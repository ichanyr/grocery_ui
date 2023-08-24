import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getProducts() async {
    emit(ProductLoading());
    final response = await http.get(Uri.parse(
        'https://api.escuelajs.co/api/v1/products?offset=100&limit=10'));
    emit(ProductSuccess(products: productFromJson(response.body)));
  }
}
