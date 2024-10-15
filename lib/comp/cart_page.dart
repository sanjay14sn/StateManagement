
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/comp/dress_tile.dart';
import 'package:untitled6/models/Dress.dart';
import 'package:untitled6/models/Dress_shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart (Dress Dress){
    Provider.of<DressShop>(context,listen:false).removeItemFromCart(Dress);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<DressShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "YOUR CART",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:value.userCart.length,
                    itemBuilder: (context, index) {
                      Dress eachDress= value.userCart[index];

                      return DressTile
                        (dress:eachDress, onPressed:() => removeFromCart(eachDress), icon:Icon(Icons.delete)

                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
