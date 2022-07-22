class Book {

  
  String? title;
  int? firstPublishYear;
  List<dynamic>? publishDate;
  List<dynamic>? isbn;
  List<dynamic>? authorName;
  List<dynamic>? firstSentence;
  List<dynamic>? subjectFacet;

  Book({
    required this.title,
    required this.firstPublishYear,
    required this.publishDate,
    required this.isbn,
    required this.authorName,
    required this.firstSentence,
    required this.subjectFacet,
  });


  static Book fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      firstPublishYear: json['first_publish_year'],
      publishDate: json['publish_date'],
      isbn: json['isbn'],
      authorName: json['author_name'],
      firstSentence: json['first_sentence'],
      subjectFacet: json['subject_facet'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'title': title, 'firstPublishYear': firstPublishYear};
}
