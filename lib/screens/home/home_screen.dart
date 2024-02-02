import 'package:flutter/material.dart';
import 'package:postman_clone/screens/navigation/navigation.dart';
import 'package:postman_clone/screens/request/request_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          NavigationPanel(),
          Expanded(child: RequestView()),
        ],
      ),
    );
  }
}
