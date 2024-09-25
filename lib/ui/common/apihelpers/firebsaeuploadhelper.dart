// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:servant_industry_hiring/services/fire_service.dart';

import '../../../app/app.locator.dart';

class FirebaseHelper {
  static Future<String> uploadFile(File? file, String phone) async {
    final fireService = locator<FireService>();

    String filename = path.basename(file!.path);
    String extension = path.extension(file.path);
    String randomChars = DateTime.now().millisecondsSinceEpoch.toString();
    String uniqueFilename = '$filename-$randomChars$extension';

    UploadTask uploadTask = fireService.storage
        .child('user')
        .child(phone)
        .child(uniqueFilename)
        .putFile(file);
    await uploadTask;
    String downloadURL = await fireService.storage
        .child('user')
        .child(phone)
        .child(uniqueFilename)
        .getDownloadURL();
    return downloadURL;
  }
}
