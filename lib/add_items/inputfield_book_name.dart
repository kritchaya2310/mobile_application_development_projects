import 'package:flutter/material.dart';

class InputFieldBookName extends StatefulWidget {
  const InputFieldBookName({Key? key}) : super(key: key);

  @override
  _InputFieldBookNameState createState() => _InputFieldBookNameState();
}

class _InputFieldBookNameState extends State<InputFieldBookName> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: 300,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: "     Enter book name",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
        onChanged: (value) {
          setState(() {});
        },
      ),
    );
  }
}
