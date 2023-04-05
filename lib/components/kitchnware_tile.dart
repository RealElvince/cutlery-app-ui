import 'package:cutleryapp/models/kitchenware.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class KitchenWareTile extends StatelessWidget {
  void Function()? onPressed;
  final KitchenWare kitchen;
  final Widget icon;
  KitchenWareTile(
      {super.key,
      required this.kitchen,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
          title: Text(kitchen.name),
          subtitle: Text(kitchen.price),
          leading: Image.asset(kitchen.imagePath),
          trailing: IconButton(
            icon: icon,
            onPressed: onPressed,
          )),
    );
  }
}
