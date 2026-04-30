import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: Duration(microseconds: 400),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.darkPrimaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: !isChecked ? Color(0xffCCCCCC) : Colors.transparent,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isChecked ? Icon(Icons.check, color: Colors.white) : SizedBox(),
      ),
    );
  }
}
