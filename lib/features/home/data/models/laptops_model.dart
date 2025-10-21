import 'package:equatable/equatable.dart';

class LaptopsModel extends Equatable {
  final String? id;
  final String? status;
  final String? category;
  final String? name;
  final num? price;
  final String? description;
  final String? image;
  final List<dynamic>? images;
  final String? company;
  final int? countInStock;
  final int? v;
  final int? sales;

  const LaptopsModel({
    this.id,
    this.status,
    this.category,
    this.name,
    this.price,
    this.description,
    this.image,
    this.images,
    this.company,
    this.countInStock,
    this.v,
    this.sales,
  });

  factory LaptopsModel.fromJson(Map<String, dynamic> json) => LaptopsModel(
    id: json['_id'] as String?,
    status: json['status'] as String?,
    category: json['category'] as String?,
    name: json['name'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    description: json['description'] as String?,
    image: json['image'] as String?,
    images: json['images'] as List<dynamic>?,
    company: json['company'] as String?,
    countInStock: json['countInStock'] as int?,
    v: json['__v'] as int?,
    sales: json['sales'] as int?,
  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'status': status,
    'category': category,
    'name': name,
    'price': price,
    'description': description,
    'image': image,
    'images': images,
    'company': company,
    'countInStock': countInStock,
    '__v': v,
    'sales': sales,
  };

  @override
  List<Object?> get props {
    return [
      id,
      status,
      category,
      name,
      price,
      description,
      image,
      images,
      company,
      countInStock,
      v,
      sales,
    ];
  }
}
