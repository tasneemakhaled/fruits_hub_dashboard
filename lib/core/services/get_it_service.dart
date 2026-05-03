import 'package:fruits_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

class GetitService {
  final getIt = GetIt.instance;
  void setUpGetIt() {
    getIt.registerSingleton<StorageService>(FireStorage());
  }
}
