import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_notes/home/home_controller.dart';
import 'package:modern_notes/models/note_model.dart';

import '../../constant/string.dart';

class CardNote extends StatelessWidget {
  final NoteModel note;
  const CardNote({
    Key? key,
    required this.note,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/editNote", arguments: note);
      },
      highlightColor: Colors.blue.withOpacity(0.4),
      splashColor: Colors.green.withOpacity(0.5),
      child: Card(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
              flex: 1,
              child: Image.network(
                linkImage + note.notesImage,
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              )),
          Expanded(
              flex: 2,
              child: ListTile(
                title: Text(note.notesTitle,
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Text(note.notesContent,
                    maxLines: 3, overflow: TextOverflow.ellipsis),
                trailing: IconButton(
                    onPressed: () {
                      Get.find<HomeController>().deleteNote(note);
                    },
                    icon: const Icon(Icons.delete)),
              )),
        ]),
      ),
    );
  }
}
