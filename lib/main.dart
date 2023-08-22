import 'package:flutter/material.dart';
import 'package:grocery_ui/data.dart';
import 'package:grocery_ui/item_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final data = Product(
    'Bayam',
    '2.000',
    '1 ikat',
    'assets/img1.png',
    'Secara umum sayuran dan buah-buahan merupakan sumber berbagai vitamin, mineral,',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: const Text(
          "Fruit and Vegetable Shop",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: (() {}),
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 3,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return ItemWidget(product: allData[index]);
            },
            itemCount: allData.length
            //supaya tidak overflow
            ),
      ),
    );
  }
}
