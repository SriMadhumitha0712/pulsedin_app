// ignore_for_file: unused_element

import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:domain/error/local_error.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  PreferenceHelper();

  /// Get a Current User Token
  static Future<Either<LocalError, String?>> getToken() async {
    try {
      String? value;
      final SharedPreferences pref = await SharedPreferences.getInstance();
      value = pref.getString("token");
      if (value?.isEmpty ?? true) {
        return const Right(null);
      } else {
        return Right(value);
      }
    } catch (e) {
      return Left(
          LocalError(cause: e as Exception, databaseError: "", message: ""));
    }
  }

  /// Save a token
  static Future<Either<LocalError, bool>> saveToken(String? token) async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      if (token == null) return const Right(false);
      final value = await pref.setString("token", token);
      return Right(value);
    } catch (e) {
      return Left(
          LocalError(cause: e as Exception, databaseError: "", message: ""));
    }
  }

  /// Clear a storage
  static Future clearStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Map<String, dynamic> _parseAndDecode(String response) {
    return jsonDecode(response) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> _parseJson(String? text) {
    return compute(_parseAndDecode, text!);
  }
}
