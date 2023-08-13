import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRow extends StatelessWidget {
  String title, value;
  CustomRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 5, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          const Divider(),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String title;
  VoidCallback? callFunction;
  CustomButton({super.key, required this.title, this.callFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callFunction,
      child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(16)),
          height: 60,
          width: 200,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )),
    );
  }
}
