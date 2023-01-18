import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_platform_interface/src/types/image_source.dart';
import 'package:modern_notes/home/home_controller.dart';

import '../../main.dart';
import '../components/request.dart';
import '../constant/string.dart';

class AddController extends GetxController with Request {
  //for image
  var isLoadingImage = false.obs;
  File? file;
  var filePath = "".obs;
  String? title, subTitle;

  ImagePicker imagePicker = ImagePicker();
  void setImagePath(String path) {
    filePath.value = path;
    isLoadingImage.value = true;
    Get.back();
  }

  void takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    file = File(pickedImage!.path);
    setImagePath(file!.path);
  }

  /////////////////////////////////

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  Request crud = Request();
  var loading = false.obs;

  makeAddNote() async {
    if (file == null) return Get.snackbar("Error", "please Add An Image");

    if (formstate.currentState!.validate()) {
      formstate.currentState!.save();
      loading.value = true;
      var response = await crud.postRequestWithFile(
          linkAdd,
          {
            "title": title,
            "content": subTitle,
            "notes_users": sPref.getString("id"),
          },
          file!);
      if (response['status'] == "success") {
        Get.find<HomeController>().getNotes();
        Get.back();
      } else {
        Get.snackbar("Error", "request failed");
        loading.value = false;
      }
      loading.value = false;
    }
  }
}
