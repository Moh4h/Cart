import 'package:cart_example/home.dart';
import 'package:cart_example/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {
      
      return Cart();
      
    },child: MaterialApp(home: Home(),),); 
  }
}
