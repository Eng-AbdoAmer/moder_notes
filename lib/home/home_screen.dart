import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_notes/components/size_config.dart';
import 'package:modern_notes/home/home_controller.dart';
import 'package:modern_notes/home/widgets/card_note.dart';

import '../add/add_note.dart';
import '../constant/string.dart';
import 'widgets/name_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sizeConfigInit(context: context);
    print(screenWidth);
    print(screenHeight);
    print(hPlanck);

    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: NameAppBar(
          name: 'HomeScreen Screen',
        ),
        actions: [
          IconButton(
              onPressed: () {
                homeController.makeLogout();
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Obx(
        () => homeController.isLoading.value
            ? Image.asset("assets/loading.gif")
            : homeController.notesList.isNotEmpty
                ? ListView.builder(
                    physics: cPhysics,
                    itemCount: homeController.notesList.length,
                    itemBuilder: (context, index) => CardNote(
                      note: homeController.notesList[index],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(hPlanck),
                    child: Text("No Notes Here"),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const AddNote());
          },
          child: const Icon(Icons.add)),
    );
  }
}
