class ListVideosEntity {
  int id;
  String name;
  String description;
  String file;
  String url;
  String url2;
  String awsUrl;
  String image;
  String imageUrl;
  int premium;
  int order;

  ListVideosEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.file,
    required this.url,
    required this.url2,
    required this.awsUrl,
    required this.image,
    required this.imageUrl,
    required this.premium,
    required this.order,
  });
}
