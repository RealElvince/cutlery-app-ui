import 'package:cutleryapp/components/kitchnware_tile.dart';
import 'package:cutleryapp/models/kitchenware.dart';
import 'package:cutleryapp/models/kitchenware_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // remove item from cart Method

  void removeFromCart(KitchenWare kitchen) {
    // remove item
    Provider.of<KitchenWareShop>(context, listen: false)
        .removeItemFromCart(kitchen);

    // Successfully removed
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text(
            'Kitchenware removed successfully from your cart!',
            style: GoogleFonts.aBeeZee(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          icon: const Icon(IconlyLight.danger),
          backgroundColor: Colors.brown[900]),
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
                'My Cart.',
                style: GoogleFonts.aBeeZee(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30.0),
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    // get  individual kitchenware
                    KitchenWare eachKitchenWare = value.kitchenWare[index];

                    // return tile for this KitchenWare
                    return KitchenWareTile(
                      icon: const Icon(Icons.delete),
                      kitchen: eachKitchenWare,
                      onPressed: () => removeFromCart(eachKitchenWare),
                    );
                  },
                ),
              ),

              // Pay Now

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                height: 50.0,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Pay Now',
                  style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
