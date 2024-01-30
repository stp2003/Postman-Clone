import 'package:flutter/material.dart';
import 'package:postman_clone/screens/navigation/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const NavigationPanel(),
          Container(),
        ],
      ),
    );
  }
}
