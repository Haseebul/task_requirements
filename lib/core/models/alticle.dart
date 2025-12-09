class Article {
  final String title;
  final String description;
  final String imageUrl;

  Article({required this.title, required this.description, required this.imageUrl});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      imageUrl: json['urlToImage'] ?? '',
    );
  }

  factory Article.empty() {
    return Article(title: '', description: '', imageUrl: '');
  }
}
