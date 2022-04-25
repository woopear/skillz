class ArticleSchema {
  String? id; 
  String title; 
  String text;

  ArticleSchema({
    this.id,
    required this.title,
    required this.text,
  });

  factory ArticleSchema.forMap(Map<String, dynamic> data, documentId) {
    String title = data['title'];
    String text = data['text'];

    return ArticleSchema(
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