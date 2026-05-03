import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductEntityModel {
  final String name;
  final String description;
  final String code;
  final num price;
  final File image;
  String? imageUrl;
  final bool isFeatured;

  AddProductEntityModel({
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.image,
    this.imageUrl,
    required this.isFeatured,
  });
  factory AddProductEntityModel.fromEntity(
    AddProductInputEntity addProductInputEntity,
  ) {
    return AddProductEntityModel(
      name: addProductInputEntity.name,
      description: addProductInputEntity.description,
      code: addProductInputEntity.code,
      price: addProductInputEntity.price,
      image: addProductInputEntity.image,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
    );
  }
  toMap() {
    return {
      'name': name,
      'description': description,
      'code': code,
      'price': price,
      'image': image,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
    };
  }
}
