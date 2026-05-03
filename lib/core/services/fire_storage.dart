import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String refrence) async {
    // refrence هو المسار اللي قبل اسم الفايل
    String fileName = b.basename(file.path);
    String fileExtenstion = b.extension(file.path);
    var imageReference = storageRef.child(
      '$refrence/$fileName.$fileExtenstion',
    );
    await imageReference.putFile(file);
    var imageUrl = imageReference.getDownloadURL();
    return imageUrl;
  }
}
