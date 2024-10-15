import 'package:flutter/material.dart';
import 'package:untitled6/models/Dress.dart';


class DressShop extends ChangeNotifier {
  // dress for sale
  final List <Dress>_shop = [
    Dress(name: "Shoes",
        price: "1500",
        imagepath: "asset/1.jpg"),
    Dress(name: "Pant",
        price: "1219",
        imagepath: "asset/2.jpg"),
    Dress(name: "Saree",
        price: "2000",
        imagepath: "asset/3.jpg"),
    Dress(name: "Treditional",
        price: "1500",
        imagepath: "asset/4.jpg"),

  ];

  List<Dress> _userCart =[];

  List<Dress> get Dress_Shop => _shop;

  List<Dress> get userCart => _userCart;

  void addItemToCart (Dress Dress) {
    _userCart.add(Dress);
    notifyListeners();

  }
  void removeItemFromCart (Dress Dress) {
    _userCart.remove(Dress);
    notifyListeners();
}}