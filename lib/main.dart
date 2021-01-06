import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/bloc/ProductBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final productBloc = ProductBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: productBloc.productCount,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('Products (${snapshot.data ?? 0})');
          },
        ),
      ),
      body: StreamBuilder(
        stream: productBloc.getProducts,
        builder: (_, AsyncSnapshot<List<String>> snapshot) {
          final List<String> products = snapshot.data ?? [];
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (_, i) {
              return ListTile(
                title: Text(products[i]),
              );
            },
          );
        },
      ),
    );
  }
}
