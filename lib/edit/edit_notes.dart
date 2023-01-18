import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../auth/widgets/custom_text_form_field.dart';
import '../components/valid.dart';
import 'editController.dart';

class EditNote extends StatelessWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditController editController = Get.put(EditController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
      ),
      body: Obx(
        () => editController.loading.value
            ? Center(
                child: Image.asset("assets/loading.gif"),
              )
            : Container(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: editController.formstate,
                  child: ListView(
                    children: [
                      CustomTextFormField(
                          mLines: 1,
                          hint: 'title',
                          initialValue: editController.note.notesTitle,
                          keyboardType: TextInputType.name,
                          isPassword: false,
                          onSave: (v) {
                            editController.note.notesTitle = v!;
                          },
                          valid: (v) {
                            return validInput(v!, 3, 255);
                          }),
                      CustomTextFormField(
                          mLines: 25,
                          hint: 'content',
                          initialValue: editController.note.notesContent,
                          keyboardType: TextInputType.text,
                          isPassword: false,
                          onSave: (v) {
                            editController.note.notesContent = v!;
                          },
                          valid: (v) {
                            return validInput(v!, 3, 1000);
                          }),
                      ElevatedButton(
                          onPressed: () async {
                            await editController.makeEditNote();
                          },
                          child: const Text(
                            "update Note",
                            style: TextStyle(fontSize: 20),
                          )),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
