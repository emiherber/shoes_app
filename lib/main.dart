import 'package:flutter/material.dart';
import 'package:shoesapp/src/pages/zapato_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShoesApp',
      debugShowCheckedModeBanner: true,
      home: ZapatoPage(),
    );
  }
}


