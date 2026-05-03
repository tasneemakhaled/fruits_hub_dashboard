import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_checkbox.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicCheckBox> createState() => _IsfeaturedcheckboxState();
}

class _IsfeaturedcheckboxState extends State<IsOrganicCheckBox> {
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('is Organic Item?'),
        Spacer(),
        CustomCheckBox(
          onChanged: (value) {
            isOrganic = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isOrganic,
        ),
      ],
    );
  }
}
