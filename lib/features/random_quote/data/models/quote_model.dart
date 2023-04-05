import 'package:test_app/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel(
      {required super.id,
      required super.content,
      required super.author,
      required super.tags,
      required super.authorSlug,
      required super.length,
      required super.dateAdded,
      required super.dateModified});

  factory QuoteModel.fromJson(Map<String, dynamic> jsonData) => QuoteModel(
        id: jsonData["_id"],
        content: jsonData["content"],
        author: jsonData["author"],
        tags: jsonData["tags"].cast<String>(),
        authorSlug: jsonData["authorSlug"],
        length: jsonData["length"],
        dateAdded: jsonData["dateAdded"],
        dateModified: jsonData["dateModified"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
        "author": author,
        "tags": tags,
        "authorSlug": authorSlug,
        "length": length,
        "dateAdded": dateAdded,
        "dateModified": dateModified,
      };
}
