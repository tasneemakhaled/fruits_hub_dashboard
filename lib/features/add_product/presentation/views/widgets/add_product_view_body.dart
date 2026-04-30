import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/custom_text_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_checkbox.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/isFeaturedCheckBox.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isFeatured = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
              ),

              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Product Code',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Product Description',
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 16),
              Isfeaturedcheckbox(
                onChanged: (value) {
                  // isFeatured = value;
                  // setState(() {});
                },
              ),
              SizedBox(height: 16),
              ImageField(onFileChanged: (image) {}),
            ],
          ),
        ),
      ),
    );
  }
}
