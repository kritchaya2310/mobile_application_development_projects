import 'package:flutter/material.dart';

class InputFieldSearch extends StatelessWidget {
  const InputFieldSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: const TextField(
        decoration: InputDecoration(
            hintText: "Enter your email",
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none),
      ),
    );
  }
}
