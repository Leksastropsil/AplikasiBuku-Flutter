class Buku {
  final int id;
  final String title;
  final String author;
  final String coverUrl;
  final String description;
  final double rating;

  Buku({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.description,
    required this.rating,
  });

  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      id: int.parse(json['id'].toString()),
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      description: json['description'] ?? '',

      coverUrl: json['cover_url'] ?? '',

      rating: double.tryParse(json['rating']?.toString() ?? '0.0') ?? 0.0,
    );
  }
}