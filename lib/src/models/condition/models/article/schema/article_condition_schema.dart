class ArticleConditionSchema {
  String? id; 
  String title; 
  String text;

  ArticleConditionSchema({
    this.id,
    required this.title,
    required this.text,
  });

  factory ArticleConditionSchema.fromMap(Map<String, dynamic> data, documentId) {
    String title = data['title'];
    String text = data['text'];

    return ArticleConditionSchema(
      id: documentId,
      title: title, 
      text: text, 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'text': text,
    };
  }
}