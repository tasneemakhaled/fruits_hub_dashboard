import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/constants/constants.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase supabase;
  static initSupaBase() async {
    supabase = await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
    var buckets = await supabase.client.storage.listBuckets();
    bool isBucketExists = false;
    for (var bucket in buckets) {
      if (bucket.id == fruitsImagesBucket) {
        isBucketExists = true;
        break;
      }
    }

    if (!isBucketExists) {
      supabase.client.storage.createBucket(fruitsImagesBucket);
    }
  }

  @override
  Future<String> uploadFile(File file, String refrence) async {
    String fileName = basename(file.path);
    String fileExtenstion = extension(file.path);
    var res = await supabase.client.storage
        .from(fruitsImagesBucket)
        .upload('$refrence/$fileName.$fileExtenstion', file);
    return res;
  }
}
