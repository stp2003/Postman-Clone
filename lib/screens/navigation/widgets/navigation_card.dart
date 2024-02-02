import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controller/navigation_controller.dart';
import '../../../models/request_model.dart';
import '../../../providers/providers.dart';

class NavigationCard extends ConsumerWidget {
  const NavigationCard({
    super.key,
    required this.request,
    required this.index,
  });

  final Request request;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seleted = ref.watch(selectedRequestIndexProvider) == index;

    return MaterialButton(
      elevation: 0.0,
      onPressed: () {
        ref.read(navigationControllerProvider).selectRequest(index: index);
      },
      padding: const EdgeInsets.all(20.0),
      color: seleted ? Colors.black26 : Colors.black54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              request.name,
              style: const TextStyle(fontSize: 14, color: Colors.white),
              softWrap: true,
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Text(
              request.type.value,
              style: const TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
            ),
          ),
          InkWell(
            onTap: () {
              ref
                  .read(navigationControllerProvider)
                  .deleteRequest(index: index);
            },
            child: const Icon(
              Icons.delete,
              size: 16,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
