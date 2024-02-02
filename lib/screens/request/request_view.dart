import 'package:flutter/material.dart';

class RequestView extends StatefulWidget {
  const RequestView({super.key});

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextFormField(
            initialValue: 'New Request',
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(border: InputBorder.none),
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey.shade300,
                ),
                child: DropdownButton(
                  underline: const SizedBox.shrink(),
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade900),
                  value: 'GET',
                  items: ['GET', 'POST', 'DEL', 'PUT']
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(e),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(width: 5.0),
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(width: 5.0),
              MaterialButton(
                padding: const EdgeInsets.all(25.0),
                color: Colors.blue,
                onPressed: () {},
                child: const Text(
                  "SEND",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
