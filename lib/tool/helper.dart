import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui' as ui;
import 'package:url_launcher/url_launcher.dart';

class Helper {

  Future exitApp() {
    return Platform.isIOS ? exit(0) : SystemNavigator.pop(animated: true);
  }

  Future jumpToPage(
      BuildContext context, {
        required String route,
        dynamic arguments,
      }) {
    return Navigator.of(context).pushNamed(route, arguments: arguments);
  }

  Future moveToPage(
      BuildContext context, {
        required String route,
        dynamic arguments,
      }) {
    return Navigator.of(context).pushReplacementNamed(
      route,
      arguments: arguments,
    );
  }

  void backToRootPage(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  String dioErrorHandler(e) {
    if (e == null) return "Unknown Error";
    if (e is! DioError) {
      if (e is String) {
        return "Error : $e";
      } else {
        return "Unknown Error";
      }
    }
    if (e.response == null) return "Error : ${e.message}";
    String response =
        "Error (${e.response!.statusCode}) : ${e.response!.statusMessage}";
    if (e.response!.data != null) {
      Map<String, dynamic>? data = e.response!.data;
      if (data != null) {
        if (data.containsKey("message")) {
          response += "\n${data["message"]}";
        }
        if (data.containsKey("errors")) {
          data["errors"]?.forEach(
                (key, value) {
              if (value is Map<String, dynamic>) {
                value.forEach((key, val) => response += "\n$val");
              } else if (value is List) {
                value.forEach((v) => response += "\n$v");
              } else {
                response += "\n$value";
              }
            },
          );
        }
      }
    }
    return response;
  }

  void showToast(String message) async {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future launcherIntent(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
