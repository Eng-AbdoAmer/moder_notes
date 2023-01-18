import 'dart:convert';

import 'package:get/get.dart';
import 'package:modern_notes/main.dart';
import 'package:modern_notes/models/note_model.dart';

import '../components/request.dart';
import '../constant/string.dart';

class HomeController extends GetxController with Request {
  RxBool isLoading = false.obs;
  List<NoteModel> notesList = [];

  @override
  void onInit() {
    getNotes();
    super.onInit();
  }

  getNotes() async {
    isLoading.value = true;
    var response = await postRequest(
      linkView,
      {
        "id": sPref.getString("id"),
      },
    );
    print(sPref.getString("id"));
    if (response != null) {
      if (json.decode(response)["status"] == "success") {
        notesList = noteModelListFromJson(response);
      }
    }
    isLoading.value = false;
  }

  makeLogout() {
    sPref.clear();
    Get.toNamed("/auth");
    Get.delete<HomeController>();
  }

  deleteNote(NoteModel note) async {
    var response = await postRequest(linkRemove, {
      "id": note.notesId,
      "imagename": note.notesImage,
    });
    if (response != null) {
      if (json.decode(response)['status'] == "success") {
        getNotes();
      }
    }
  }
}
