import 'dart:convert';

List<NoteModel> noteModelListFromJson(String str) => List<NoteModel>.from(
    json.decode(str)['data'].map((x) => NoteModel.fromJson(x)));

class NoteModel {
  NoteModel({
    this.notesId,
    required this.notesTitle,
    required this.notesContent,
    required this.notesImage,
    required this.notesUsers,
  });

  String? notesId;
  String notesTitle;
  String notesContent;
  String notesImage;
  String notesUsers;

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        notesId: json["notes_id"],
        notesTitle: json["notes_title"],
        notesContent: json["notes_content"],
        notesImage: json["notes_image"],
        notesUsers: json["notes_users"],
      );

  Map<String, dynamic> toJson() => {
        "notes_id": notesId,
        "notes_title": notesTitle,
        "notes_content": notesContent,
        "notes_image": notesImage,
        "notes_users": notesUsers,
      };
}
