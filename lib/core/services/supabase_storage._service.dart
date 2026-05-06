import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late  Supabase supabase;
  static  initSupaBase() async {
   supabase= await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  }

  @override
  Future<String> uploadFile(File file, String refrence) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }
}
