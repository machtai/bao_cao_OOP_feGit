 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLogIn extends StatelessWidget {
  String text;
  Icon icon;
  Color color;
  ButtonLogIn({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {},
        child: Container(
            child: Row(
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 12),
            ),
          ],
        )));
  }
}

class FieldInput extends StatelessWidget {
  bool check ;
  String text;
  Icon icon;
  TextInputType textInputType;
  FieldInput(
      {super.key, required this.text, required this.icon, required this.textInputType,required this.check});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.height * 0.3739130434782609,
      height: size.height * 0.062111801242236,
      child: TextFormField(
        obscureText: check,
          keyboardType: textInputType,
          decoration: InputDecoration(
              hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.224)),
              filled: true, // Có nền
              fillColor: Colors.grey[200], // Màu nền
              hintText: text,
              prefixIcon: icon,
              border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20))))),
    );
  }
}
