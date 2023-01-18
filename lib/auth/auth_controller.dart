import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/request.dart';
import '../constant/string.dart';
import '../main.dart';

class AuthController extends GetxController with Request {
  RxBool isLogin = true.obs;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String? userName, email, password;
  RxBool isLoading = false.obs;
  void submit() {
    if (formState.currentState!.validate()) {
      formState.currentState!.save();
      isLoading.value = true;
      isLogin.value ? login() : signup();
      isLoading.value = false;
    }
  }

  login() async {
    String? response = await postRequest(linkLogin, {
      "email": email,
      "password": password,
    });
    if (response != null) {
      var data = json.decode(response)['data'];
      sPref.setString("id", data['id'].toString());
      sPref.setString("username", data['username']);
      sPref.setString("email", data['email']);
      Get.offAllNamed("/home");
    }
  }

  changeScreen() {
    isLogin.toggle();
  }

  signup() async {
    String? response = await postRequest(linkSignUp, {
      "username": userName,
      "email": email,
      "password": password,
    });
    if (json.decode(response!)['status'] == "success") {
      login();
    }
  }
}
