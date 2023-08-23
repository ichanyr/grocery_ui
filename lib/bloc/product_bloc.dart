import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_ui/models/product.dart';
import 'package:http/http.dart' as http;
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      //emit untuk merubah state
      emit(ProductLoading());
      final response =
          await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
      emit(ProductSuccess(products: productFromJson(response.body)));
    });
  }
}
