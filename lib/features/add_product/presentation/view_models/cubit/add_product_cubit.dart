import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
    : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;
  Future<Either<Failure, void>> addProduct(
    AddProductInputEntity addProductInputEntity,
  ) async {
    emit(AddProductLoading());
    var urlResult = await imagesRepo.uploadImage(addProductInputEntity.image);
    return urlResult.fold(
      (f) {
        emit(AddProductFailure(errMessage: f.errMessage));
        return Left(f);
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(
          addProductInputEntity: addProductInputEntity,
        );
        return result.fold(
          (f) {
            emit(AddProductFailure(errMessage: f.errMessage));
            return Left(f);
          },
          (_) {
            emit(AddProductSuccess());
            return Right(null);
          },
        );
      },
    );
  }
}
