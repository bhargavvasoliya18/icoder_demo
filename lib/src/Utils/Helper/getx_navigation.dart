
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future? navigatePush(Widget destination) {
  return Get.to(destination);
}

void navigatePushAndRemoveUntil(Widget destination, {bool Function(Route<dynamic>)? predict}) {
  Get.offAll(destination, predicate: predict);
}

void navigatePop({result}){
  Get.back(result: result);
}