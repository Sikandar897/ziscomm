import 'package:flutter/material.dart';
import '../../utils/app_constant.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(AppConstant.appSecondoryColor),
        backgroundColor: MaterialStateProperty.all(AppConstant.appMainColor),
        overlayColor: MaterialStateProperty.all(AppConstant.appSecondoryColor),
        elevation: MaterialStateProperty.all(21),
        minimumSize: MaterialStateProperty.all(const Size(150, 50)),
      ),
      child: isLoading
          ? const CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(AppConstant.appTextColor),
            )
          : Text(
              text,
              style: const TextStyle(color: AppConstant.appTextColor),
            ),
    );
  }
}
