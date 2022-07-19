class Book {
  String type;
  String name;
  String publisher;
  DateTime date;
  String imgUrl;
  double score;
  double rating;
  String description;
  double height;
  Book(this.type, this.name, this.publisher, this.date, this.imgUrl,
      this.description, this.height, this.rating, this.score);

  static List<Book> generateBooks() {
    return [
      Book(
          'history',
          'The hobbit',
          '1996',
          DateTime(2019, 3, 23),
          'https://cdn.pixabay.com/photo/2021/06/06/08/50/the-land-of-the-hobbits-6314749_960_720.jpg',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          250,
          10,
          4.7),
      Book(
          'history',
          'The hobbit 2',
          '1996',
          DateTime(2019, 3, 23),
          'https://cdn.pixabay.com/photo/2021/06/06/08/50/the-land-of-the-hobbits-6314749_960_720.jpg',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          200,
          10,
          4.7),
      Book(
          'history',
          'The hobbit 3',
          '1996',
          DateTime(2019, 3, 23),
          'https://cdn.pixabay.com/photo/2021/06/06/08/50/the-land-of-the-hobbits-6314749_960_720.jpg',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          300,
          10,
          4.7),
      Book(
          'history',
          'The hobbit 4',
          '1996',
          DateTime(2019, 3, 23),
          'https://cdn.pixabay.com/photo/2021/06/06/08/50/the-land-of-the-hobbits-6314749_960_720.jpg',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          200,
          10,
          4.7),
      Book(
          'history',
          'The hobbit',
          '1996',
          DateTime(2019, 3, 23),
          'https://cdn.pixabay.com/photo/2021/06/06/08/50/the-land-of-the-hobbits-6314749_960_720.jpg',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          250,
          10,
          4.7),
      Book(
          'history',
          'The hobbit',
          '1996',
          DateTime(2019, 3, 23),
          'https://cdn.pixabay.com/photo/2021/06/06/08/50/the-land-of-the-hobbits-6314749_960_720.jpg',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          300,
          10,
          4.7),
      Book(
          'history',
          'The hobbit',
          '1996',
          DateTime(2019, 3, 23),
          'https://cdn.pixabay.com/photo/2021/06/06/08/50/the-land-of-the-hobbits-6314749_960_720.jpg',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          250,
          10,
          4.7),
    ];
  }
}
