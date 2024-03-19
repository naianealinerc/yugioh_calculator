import 'package:flutter/material.dart';

class CounterForm extends StatelessWidget {
  const CounterForm({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: TextFormField(
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.bodyLarge,
          showCursor: false,
          keyboardType: TextInputType.number,
          controller: controller,
          onTap: () {
            controller.text = "";
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(right: 8),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }
}
