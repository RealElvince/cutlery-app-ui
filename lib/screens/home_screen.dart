import 'package:cutleryapp/components/kitchnware_tile.dart';
import 'package:cutleryapp/models/kitchenware.dart';
import 'package:cutleryapp/models/kitchenware_shop.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // add item to cart method
  void addToCart(KitchenWare kitchen) {
    // add item
    Provider.of<KitchenWareShop>(context, listen: false).addItemToCart(kitchen);

    // show dialog
    // Successfully removed
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Kitchenware added successfully to your cart!',
          style: GoogleFonts.aBeeZee(color: Colors.black),
        ),
        icon: const Icon(IconlyLight.info_square),
        backgroundColor: Colors.brown[900],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KitchenWareShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                'If you can organise your kitchenware, you can organise your life.',
                style: GoogleFonts.aBeeZee(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30.0),
              Expanded(
                child: ListView.builder(
                  itemCount: value.kitchenWare.length,
                  itemBuilder: (context, index) {
                    // get  individual kitchenware
                    KitchenWare eachKitchenWare = value.kitchenWare[index];

                    // return tile for this KitchenWare
                    return KitchenWareTile(
                      icon: const Icon(Icons.add),
                      kitchen: eachKitchenWare,
                      onPressed: () => addToCart(eachKitchenWare),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
