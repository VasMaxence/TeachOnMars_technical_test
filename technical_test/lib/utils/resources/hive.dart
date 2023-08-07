// ignore_for_file: inference_failure_on_function_invocation

import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:technical_test/domain/model/image/image_model.dart';
import 'package:technical_test/domain/model/post/post_model.dart';

void initHiveAdapter() {
  Hive
    ..registerAdapter(PostModelAdapter())
    ..registerAdapter(ImageModelAdapter());
}

void disposeHive() {
  Hive.close();
}

Future<void> initHive() async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
  final hiveFile = File('${appDocumentDir.path}/users.hive');

  if (!hiveFile.existsSync()) {
    await hiveFile.create(recursive: true);
  }

  await Hive.initFlutter(appDocumentDir.path);

  initHiveAdapter();

  await Hive.openBox('posts', path: appDocumentDir.path);
}
