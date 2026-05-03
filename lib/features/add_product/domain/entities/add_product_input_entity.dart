import 'dart:io';

import 'package:fruits_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class AddProductInputEntity {
  final String name;
  final String description;
  final String code;
  final num price;
  final File image;
  String? imageUrl;
  final bool isFeatured;
  final int expirationMonths;
  bool isOrganic = false;
  final int numOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final List<ReviewEntity> reviews;
  AddProductInputEntity({
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    required this.image,
    this.imageUrl,
    required this.isOrganic,
    required this.isFeatured,
    required this.expirationMonths,
    required this.numOfCalories,
    required this.unitAmount,
    required this.reviews,
  });
}
