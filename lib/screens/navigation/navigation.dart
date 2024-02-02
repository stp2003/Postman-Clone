import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postman_clone/screens/navigation/widgets/navigation_card.dart';
import 'package:postman_clone/utils/colors.dart';

import '../../controller/navigation_controller.dart';
import '../../providers/providers.dart';

class NavigationPanel extends ConsumerWidget {
  const NavigationPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openRequests = ref.watch(requestListProvider);

    return SizedBox(
      width: 200,
      child: Container(
        color: cardColor,
        child: Column(
          children: [
            MaterialButton(
              padding: const EdgeInsets.all(20.0),
              color: appBarColor,
              elevation: 15.0,
              onPressed: () {
                ref.read(navigationControllerProvider).addNewRequest();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Tab",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      letterSpacing: 0.8,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.add,
                    size: 25.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: openRequests.length,
                itemBuilder: (context, index) {
                  return NavigationCard(
                    request: openRequests[index],
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
