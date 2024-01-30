import 'package:flutter/material.dart';

class NavigationCard extends StatelessWidget {
  const NavigationCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      onPressed: () {},
      padding: const EdgeInsets.all(20.0),
      color: Colors.grey.shade300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Request',
            style: TextStyle(fontSize: 14),
          ),
          const Text(
            'GET',
            style: TextStyle(fontSize: 12),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.delete,
              size: 16,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
