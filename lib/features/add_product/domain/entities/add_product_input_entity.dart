import 'dart:io';

class AddProductInputEntity {
  final String name;
  final String description;
  final String code;
  final num price;
  final File image;
  String? imageUrl;
  final bool isFeatured;

  AddProductInputEntity({
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.image,
    this.imageUrl,
    required this.isFeatured,
  });
}
