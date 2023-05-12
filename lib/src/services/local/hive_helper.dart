import 'package:hive_flutter/hive_flutter.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter('cache');

  /// [TODO]
  /// Open Hive Box
}

Future<void> hiveClose() async {
  await Hive.close();
}
