

class Todo{
  final String title;
  final String desc;
  Todo({ required this.title, required this.desc});
  // Factory constructor to create Todo object from a map
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'],
      desc: map['desc'],
    );
  }

  // Convert Todo object to a map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': desc,
    };
  }
}