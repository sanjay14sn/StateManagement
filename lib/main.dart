import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/Homepage.dart';
import 'package:untitled6/models/Dress_shop.dart';
import 'package:get/get.dart';
void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => DressShop(),
    builder:(context,child) => GetMaterialApp(
      debugShowCheckedModeBanner:false,
      home:Homepage(),
    ),);
  }
}
