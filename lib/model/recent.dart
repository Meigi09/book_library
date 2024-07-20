class Recent {
  final String title, image;
  final int percent;

  Recent({
    required this.title,
    required this.image,
    required this.percent,
  });
}

List<Recent> recents = [
  Recent(image: "assets/images/book-1.png", title: "The Magic", percent: 50),
  Recent(image: "assets/images/book-2.png", title: "The Martian", percent: 80),
  Recent(image: "assets/images/book-3.png", title: "Operating", percent: 10),
  Recent(image: "assets/images/book-2.png", title: "The Martian", percent: 80),
];