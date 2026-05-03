import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/data_base_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/models/add_product_input_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DataBaseService dataBaseService;

  ProductsRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addProduct({
    required AddProductInputEntity addProductInputEntity,
  }) async {
    try {
      await dataBaseService.addData(
        path: BackendEndpoints.addProducts,
        data: AddProductInputModel.fromEntity(addProductInputEntity).toMap(),
      );
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(errMessage: 'failed to add produxt'));
    }
  }
}
