

import 'package:flutter/material.dart';

class ButtonConfirm extends StatelessWidget {
  const ButtonConfirm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width/7,
      width: size.width,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Color(0xff53E88B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: const Text(
          'Xác nhận',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}