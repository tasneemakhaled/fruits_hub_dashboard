import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/services/data_base_service.dart';
import 'package:fruits_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

class GetitService {
  final getIt = GetIt.instance;
  void setUpGetIt() {
    getIt.registerSingleton<StorageService>(FireStorage());
    getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(storageService: getIt.get<StorageService>()),
    );
    getIt.registerSingleton<DataBaseService>(FireStoreService());
    getIt.registerSingleton<ProductsRepo>(
      ProductsRepoImpl(dataBaseService: getIt.get<DataBaseService>()),
    );
  }
}
