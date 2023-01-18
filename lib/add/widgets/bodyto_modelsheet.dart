import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modern_notes/add/addController.dart';

class BodyToModelSheet extends StatelessWidget {
  const BodyToModelSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddController addController = Get.find<AddController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("choose image from camera or gallery"),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              IconButton(
                  onPressed: () async {
                    addController.takePhoto(ImageSource.camera);
                  },
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 35,
                  )),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () async {
                    addController.takePhoto(ImageSource.gallery);
                  },
                  icon: const Icon(
                    Icons.camera,
                    size: 35,
                  )),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
