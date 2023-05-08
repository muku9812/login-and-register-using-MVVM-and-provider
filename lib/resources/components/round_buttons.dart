import 'package:flutter/material.dart';
import 'package:mvvm/resources/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loadig;
  final VoidCallback onPress;

  const RoundButton(
      {super.key,
      required this.title,
      this.loadig = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColor.buttonColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: loadig
                ? const CircularProgressIndicator()
                : Text(
                    title,
                    style: const TextStyle(color: AppColor.whiteColor),
                  )),
      ),
    );
  }
}
