class Book {
  Book({
    required this.title,
    required this.firstPublishYear,
    required this.publishDate,
    required this.isbn,
    required this.authorName,
    required this.firstSentence,
    required this.subjectFacet,
  });

  String title;
  String firstPublishYear;
  List<String> publishDate;
  List<String> isbn;
  List<String> authorName;
  List<String> firstSentence;
  List<String> subjectFacet;

  static Book fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      firstPublishYear: json['firstPublishYear'],
      publishDate: json['publishDate'],
      isbn: json['isbn'],
      authorName: json['authorName'],
      firstSentence: json['firstSentence'],
      subjectFacet: json['subjectFacet'],
    );
  }
}
