import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_checkbox.dart';

class Isfeaturedcheckbox extends StatefulWidget {
  const Isfeaturedcheckbox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<Isfeaturedcheckbox> createState() => _IsfeaturedcheckboxState();
}

class _IsfeaturedcheckboxState extends State<Isfeaturedcheckbox> {
  bool isFeatured = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChanged: (value) {
            isFeatured = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isFeatured,
        ),
        SizedBox(width: 10),

        Expanded(child: Text('is Featured?')),
      ],
    );
  }
}
