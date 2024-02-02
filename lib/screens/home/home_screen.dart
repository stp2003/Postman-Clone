import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postman_clone/screens/navigation/navigation.dart';
import 'package:postman_clone/screens/request/request_view.dart';

import '../../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const NavigationPanel(),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final selectedIndex = ref.watch(selectedRequestIndexProvider);
                if (selectedIndex == -1) {
                  return const Center(
                    child: Text("No request selected"),
                  );
                }

                final requests = ref.watch(requestListProvider);
                return IndexedStack(
                  index: selectedIndex,
                  children: requests
                      .map(
                        (e) => RequestView(
                          id: e.id,
                          key: Key(e.id),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
