import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Stack(
        children: [
          Container(
            width: 170,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                ),
                Text("category"),
                SizedBox(
                  height: 10,
                ),
                Text("seller name"),
              ],
            ),
          ),
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }
}
