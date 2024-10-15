import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/carousel/carousel.dart';
import 'package:untitled6/comp/dress_tile.dart';
import 'package:untitled6/models/Dress.dart';
import 'package:untitled6/models/Dress_shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addToCart(Dress dress) {
    Provider.of<DressShop>(context, listen: false).addItemToCart(dress);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DressShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [

               Carousel(),

               SizedBox(height: 20),

               Text(
                "What’s your fashion flavor today?",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: value.Dress_Shop.length,
                  itemBuilder: (context, index) {
                    Dress eachDress = value.Dress_Shop[index];

                    return DressTile(
                      dress: eachDress,
                      icon: const Icon(Icons.add),
                      onPressed: () => addToCart(eachDress),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
