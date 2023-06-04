import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:myflix/src/features/domain.dart';
import 'package:myflix/src/shared/extensions/extensions.dart';

class HiveService {
  /// [TODO]
  /// all business logic in hive
  final hiveUser = Hive.box<String>(HiveKey.userBox);

  User? getUser() {
    try {
      final hiveJson = hiveUser.get(HiveKey.user);
      if (hiveJson.isNullOrEmpty()) return null;

      final userJson = jsonDecode(hiveJson!);
      return User.fromJson(userJson);
    } catch (error, st) {
      log(error.toString(), error: error, stackTrace: st);
      return null;
    }
  }

  void saveUser(User user) {
    final userJson = user.toJson();
    final hiveJson = jsonEncode(userJson);
    hiveUser.put(HiveKey.user, hiveJson);
  }

  void logout() {
    hiveUser.delete(HiveKey.user);
  }
}

final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});
