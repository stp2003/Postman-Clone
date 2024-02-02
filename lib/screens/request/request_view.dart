import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/json.dart' show json;
import 'package:postman_clone/screens/request/widgets/parameters.dart';
import 'package:postman_clone/screens/request/widgets/response.dart';
import 'package:postman_clone/utils/colors.dart';

import '../../controller/request_controller.dart';
import '../../models/request_model.dart';
import '../../providers/providers.dart';

class RequestView extends ConsumerStatefulWidget {
  const RequestView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  ConsumerState<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends ConsumerState<RequestView> {
  late final CodeController bodyController;

  @override
  void initState() {
    super.initState();
    final request = ref.read(
      requestListProvider.select(
        (value) {
          return value.firstWhere((element) => element.id == widget.id);
        },
      ),
    );

    bodyController = CodeController(
      text: request.body,
      language: json,
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = ref.watch(
      requestListProvider.select(
        (value) {
          return value.firstWhere((element) => element.id == widget.id);
        },
      ),
    );

    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(fontSize: 20, color: Colors.white),
            initialValue: request.name,
            decoration: const InputDecoration(border: InputBorder.none),
            onChanged: (value) {
              ref
                  .read(requestControllerProvider)
                  .updatedRequest(id: widget.id, name: value);
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: cardColor,
                ),
                child: DropdownButton(
                  underline: const SizedBox.shrink(),
                  style: const TextStyle(fontSize: 16),
                  value: request.type,
                  dropdownColor: appBarColor,
                  items: RequestType.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              e.value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    ref
                        .read(requestControllerProvider)
                        .updatedRequest(id: widget.id, type: value);
                  },
                ),
              ),
              const SizedBox(width: 10.0),
              Flexible(
                child: TextFormField(
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  initialValue: request.url,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    ref
                        .read(requestControllerProvider)
                        .updatedRequest(id: widget.id, url: value);
                  },
                ),
              ),
              const SizedBox(width: 10.0),
              MaterialButton(
                padding: const EdgeInsets.all(25.0),
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  ref
                      .read(requestControllerProvider)
                      .sendRequest(id: widget.id);
                },
                child: const Text(
                  "SEND",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          request.running
              ? const LinearProgressIndicator()
              : const SizedBox.shrink(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ParametersView(
                    onChanged: (value) {
                      ref
                          .read(requestControllerProvider)
                          .updatedRequest(id: widget.id, body: value);
                    },
                    body: request.body,
                    controller: bodyController,
                  ),
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: ResponseView(
                    response: request.response,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
