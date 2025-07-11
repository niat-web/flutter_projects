import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';


@JsonSerializable()
class CartModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final int product_id;

  CartModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.product_id,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
