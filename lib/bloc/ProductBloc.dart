import 'dart:async';

const List<String> PRODUCTS = ['Microphone', 'Keyboard', 'Camera', 'Monitor'];

class ProductBloc {
  Stream<List<String>> get getProducts async* {
    final List<String> _products = [];
    for (String product in PRODUCTS) {
      await Future.delayed(Duration(seconds: 1));
      _products.add(product);
      yield _products;
    }
  }

  StreamController<int> _productCount = StreamController<int>();
  Stream<int> get productCount => _productCount.stream;

  ProductBloc() {
    getProducts.listen((list) => _productCount.add(list.length));
  }

  dispose() {
    _productCount.close();
  }
}
