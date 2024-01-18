import 'package:teste_lojong/features/app/domain/entities/list_videos_entity.dart';

class ListVideosModel extends ListVideosEntity {
  ListVideosModel({
    required super.id,
    required super.name,
    required super.description,
    required super.file,
    required super.url,
    required super.url2,
    required super.awsUrl,
    required super.image,
    required super.imageUrl,
    required super.premium,
    required super.order,
  });

  factory ListVideosModel.fromJson(Map<String, dynamic> json) =>
      ListVideosModel(
        id: json["id"] ?? '',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        file: json["file"] ?? '',
        url: json["url"] ?? '',
        url2: json["url2"] ?? '',
        awsUrl: json["aws_url"] ?? '',
        image: json["image"] ?? '',
        imageUrl: json["image_url"] ?? '',
        premium: json["premium"] ?? '',
        order: json["order"] ?? '',
      );
}
