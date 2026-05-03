import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/utils/widgets/custom_text_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/view_models/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_checkbox.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/isFeaturedCheckBox.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_organic_check_box.dart';
import 'package:fruits_hub_dashboard/features/dashboard/views/widgets/custom_button.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late int expirationMonths, numOfCalories, unitAmount;
  late num price;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;
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
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
              ),

              SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  price = value! as num;
                },
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'Product Code',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  expirationMonths = value! as int;
                },
                hintText: 'Expiration Months',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  numOfCalories = value! as int;
                },
                hintText: 'Num Of Calories',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextField(
                onSaved: (value) {
                  unitAmount = value! as int;
                },
                hintText: 'Unit Amount',
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'Product Description',
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 16),
              Isfeaturedcheckbox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              IsOrganicCheckBox(
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              SizedBox(height: 16),
              ImageField(
                onFileChanged: (fileImage) {
                  image = fileImage!;
                },
              ),
              SizedBox(height: 24),
              CustomButton(
                text: 'Add Product',
                onPressed: () {
                  if (image != null) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      AddProductInputEntity inputEntity = AddProductInputEntity(
                        name: name,
                        description: description,
                        code: code,
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                        expirationMonths: expirationMonths,
                        numOfCalories: numOfCalories,
                        unitAmount: unitAmount,
                        isOrganic: isOrganic,
                      );
                      context.read<AddProductCubit>().addProduct(inputEntity);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('please select an image')),
                    );
                  }
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
