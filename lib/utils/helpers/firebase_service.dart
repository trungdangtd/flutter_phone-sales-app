import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFireBaseStorageService extends GetxController {
  static TFireBaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final bytedata = await rootBundle.load(path);
      final imageData = bytedata.buffer
          .asUint8List(bytedata.offsetInBytes, bytedata.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Lỗi tải ảnh $e';
    }
  }

  Future<String> uploadImageData(String path, Uint8List image, String name) async {
  try {
    final ref = _firebaseStorage.ref(path).child(name);
    await ref.putData(image);
    final url = await ref.getDownloadURL();
    return url;
  } catch (e) {
    // Handle exceptions gracefully
    if (e is FirebaseException) {
      throw 'Firebase Exception: ${e.message}';
    } else if (e is SocketException) {
      throw 'Network Error: ${e.message}';
    } else if (e is PlatformException) {
      throw 'Platform Exception: ${e.message}';
    } else {
      throw 'Something Went Wrong! Please try again.';
    }
  }
}

Future<String> uploadImageFile(String path, XFile image) async {
  try {
    final ref = _firebaseStorage.ref(path).child(image.name);
    await ref.putFile(File(image.path));
    final url = await ref.getDownloadURL();
    return url;
  } catch (e) {
    // Handle exceptions gracefully
    if (e is FirebaseException) {
      throw 'Firebase Exception: ${e.message}';
    } else if (e is SocketException) {
      throw 'Network Error: ${e.message}';
    } else if (e is PlatformException) {
      throw 'Platform Exception: ${e.message}';
    } else {
      throw 'Something Went Wrong! Please try again.';
    }
  }
}

}
