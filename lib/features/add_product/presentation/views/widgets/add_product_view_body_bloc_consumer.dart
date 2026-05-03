import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/view_models/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (BuildContext context, state) {
        if (state is AddProductFailure) {
          buildBar(context, state.errMessage);
        } else if (state is AddProductSuccess) {
          buildBar(context, 'product added successfully');
        }
      },
      builder: (BuildContext context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoading,
          child: AddProductViewBody(),
        );
      },
    );
  }
}
