import 'package:cutleryapp/models/kitchenware_shop.dart';
import 'package:cutleryapp/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

void main() => runApp(const CutleryApp());

class CutleryApp extends StatelessWidget {
  const CutleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<KitchenWareShop>(
            create: (_) => KitchenWareShop()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cutlery App',
        theme: ThemeData(brightness: Brightness.light),
        home: const OnboardingScreen(),
      ),
    );
  }
}
