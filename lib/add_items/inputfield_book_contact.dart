import 'package:flutter/material.dart';

class InputFieldBookContact extends StatelessWidget {
  const InputFieldBookContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: 300,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: const TextField(
        decoration: InputDecoration(
            hintText: "     Enter your contact",
            hintStyle: TextStyle(color: Colors.grey),
            // prefixIcon: Icon(Icons.search),
            border: InputBorder.none),
      ),
    );
  }
}
