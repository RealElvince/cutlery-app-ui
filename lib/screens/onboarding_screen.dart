import 'package:cutleryapp/screens/home_screen.dart';
import 'package:iconly/iconly.dart';
import 'package:cutleryapp/screens/account_screen.dart';
import 'package:cutleryapp/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // selected  item index
  int _selectedIndex = 0;

  // List of screens

  final List _screens = const [HomeScreen(), CartScreen(), AccountScreen()];

  // on item tapped function
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(child: _screens[_selectedIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: const BoxDecoration(),
          child: BottomNavigationBar(
            backgroundColor: Colors.brown,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                      _selectedIndex == 0 ? IconlyBold.home : IconlyBold.home),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                      _selectedIndex == 1 ? IconlyBold.buy : IconlyLight.buy),
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(_selectedIndex == 2
                      ? IconlyLight.profile
                      : IconlyLight.profile),
                  label: 'Account'),
            ],
          ),
        ),
      ),
    );
  }
}
