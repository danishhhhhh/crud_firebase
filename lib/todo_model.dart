class TodoModel {
  String? id;
  String? title;
  String? note;

  TodoModel({this.id, this.title, this.note});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    note = json["note"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["note"] = note;
    return data;
  }
}