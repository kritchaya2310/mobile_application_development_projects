import 'package:flutter/material.dart';

class InputFieldBookDescription extends StatelessWidget {
  const InputFieldBookDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: 300,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: const TextField(
        maxLines: null,
        decoration: InputDecoration(
            hintText: "     Description",
            hintStyle: TextStyle(color: Colors.grey),
            // prefixIcon: Icon(Icons.search),
            border: InputBorder.none),
      ),
    );
  }
}
