import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.label,
    this.widget,
    this.controller,
    required this.sizeoflabel,
    required this.obscureText,
  }) : super(key: key);

  final String label;
  final Widget? widget;
  final TextEditingController? controller;
  final double sizeoflabel;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    double height(double n) {
      return MediaQuery.of(context).size.height * (n / 851);
    }

    double width(double n) {
      return MediaQuery.of(context).size.width * (n / 393);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color.fromARGB(255, 221, 59, 116),
          ),
          // style: lableInputField(sizeoflabel),
        ),
        Container(
          margin: EdgeInsets.only(
            top: height(4),
          ),
          width: width(313),
          height: height(38),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: width(2),
                color: const Color(0xFF5B618A),
              ),
            ),
            color: const Color(0xFFEBEBEB),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  obscureText: obscureText,
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              widget ?? Container(),
              SizedBox(
                width: width(9),
              )
            ],
          ),
        ),
      ],
    );
  }
}
