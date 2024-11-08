

import 'package:chain_break/utils/colors.dart';
import 'package:chain_break/utils/fonts.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String bText;
  const AppButton({super.key, required this.onTap, required this.bText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          fixedSize: const Size(500, 50)),
      child: Text(bText, style: Fonts.normalWhite,),
    );
  }
}
