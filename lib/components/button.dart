import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final String text;
  void Function()? onTap;

  MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 70, 172, 255),
          borderRadius: BorderRadiusDirectional.circular(40),
          border: Border.all(
            color: Color.fromARGB(0, 133, 133, 133),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(width: 25),
            //icon
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
