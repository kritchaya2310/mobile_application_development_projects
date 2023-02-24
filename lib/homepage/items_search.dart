import 'package:flutter/material.dart';

class ItemsSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.redAccent,
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Center(child: Text("Horror")),
        ),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
