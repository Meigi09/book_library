class Book {
  final int id;
  final String title;
  final String author;
  final double rating;
  final bool isRead;
  final String image;
  final bool isFavorite;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.rating,
    required this.isRead,
    required this.image,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'rating': rating,
      'isRead': isRead ? 1 : 0,
      'image': image,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      rating: map['rating'],
      isRead: map['isRead'] == 1,
      image: map['image'],
      isFavorite: map['isFavorite'] == 1,
    );
  }
}
