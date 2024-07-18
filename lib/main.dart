import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_store_mobile/app.dart';
import 'package:flutter_store_mobile/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_store_mobile/firebase_options.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// import 'package:flutter_store_mobile/utils/theme/theme.dart';

Future<void> main() async {
  // add widgets binding
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  //get local storage
  await GetStorage.init();
  //
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  //init firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  runApp(const App());
  //runapp
}
