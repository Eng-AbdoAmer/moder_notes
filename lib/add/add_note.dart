import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_notes/add/widgets/bodyto_modelsheet.dart';

import '../auth/widgets/custom_text_form_field.dart';
import '../components/request.dart';
import '../components/valid.dart';
import 'addController.dart';

class AddNote extends StatelessWidget with Request {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddController addController = Get.put(AddController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Note"),
      ),
      body: Obx(
        () => addController.loading.value
            ? Center(
                child: Image.asset("assets/loading.gif"),
              )
            : Container(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: addController.formstate,
                  child: ListView(
                    children: [
                      CustomTextFormField(
                          mLines: 1,
                          hint: 'title',
                          keyboardType: TextInputType.name,
                          isPassword: false,
                          onSave: (v) {
                            addController.title = v;
                          },
                          valid: (v) {
                            return validInput(v!, 3, 255);
                          }),
                      CustomTextFormField(
                          mLines: 25,
                          hint: 'content',
                          keyboardType: TextInputType.text,
                          isPassword: false,
                          onSave: (v) {
                            addController.subTitle = v;
                          },
                          valid: (v) {
                            return validInput(v!, 3, 1000);
                          }),
                      Obx(
                        () => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: addController.filePath == ""
                                    ? Colors.blue
                                    : Colors.green),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => const SizedBox(
                                        height: 120,
                                        child: BodyToModelSheet(),
                                      ));
                            },
                            child: const Text("Choose Image",
                                style: TextStyle(fontSize: 20))),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            await addController.makeAddNote();
                          },
                          child: const Text(
                            "Add",
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
