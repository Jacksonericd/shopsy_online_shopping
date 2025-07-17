import 'package:json_annotation/json_annotation.dart';
import 'package:shopsy/domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.productName,
    required super.description,
    required super.imageUrl,
    required super.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  factory ProductModel.fromEntity(Product product) => ProductModel(
    id: product.id,
    productName: product.productName,
    description: product.description,
    price: product.price,
    imageUrl: product.imageUrl,
  );

  Product toEntity() => Product(
    id: id,
    productName: productName,
    description: description,
    price: price,
    imageUrl: imageUrl,
  );
}
