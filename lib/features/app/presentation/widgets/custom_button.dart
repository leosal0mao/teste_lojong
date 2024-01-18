import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final IconData buttonIcon;
  final Color iconColor;
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  const CustomButton({
    super.key,
    this.onTap,
    required this.buttonIcon,
    required this.iconColor,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
            left: screenSize.width / 4.5, right: screenSize.width / 4.5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: buttonColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  buttonIcon,
                  color: iconColor,
                ),
                Text(
                  buttonText,
                  style: TextStyle(
                    color: buttonTextColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
