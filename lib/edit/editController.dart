import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_notes/home/home_controller.dart';
import 'package:modern_notes/models/note_model.dart';

import '../components/request.dart';
import '../constant/string.dart';

class EditController extends GetxController {
  late NoteModel note;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  Request crud = Request();
  var loading = false.obs;

  makeEditNote() async {
    if (formstate.currentState!.validate()) {
      formstate.currentState!.save();
      loading.value = true;
      var response = await crud.postRequest(linkEdit, {
        "title": note.notesTitle,
        "content": note.notesContent,
        "id": note.notesId,
      });
      if (json.decode(response!)['status'] == "success") {
        Get.find<HomeController>().getNotes();
        Get.back();
      } else {
        Get.snackbar("Error", "request failed");
      }
      loading.value = false;
    }
  }

  @override
  void onInit() {
    note = Get.arguments;
    super.onInit();
  }
}
