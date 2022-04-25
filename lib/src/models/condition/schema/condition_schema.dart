import 'package:cloud_firestore/cloud_firestore.dart';

class ConditionSchema {
  String? id; 
  Timestamp date; 
  String title;

  ConditionSchema({
    this.id,
    required this.date,
    required this.title,
  });

  factory ConditionSchema.forMap(Map<String, dynamic> data, documentId) {
    Timestamp date = data['date'];
    String title = data['title'];

    return ConditionSchema(
      id: documentId,
      date: date, 
      title: title, 
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'title': title,
    };
  }
}