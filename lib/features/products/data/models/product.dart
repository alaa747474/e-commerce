import 'package:e_commerce_app/features/products/data/models/rating.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'product.g.dart';
@HiveType(typeId: 0)
class Product extends Equatable{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  dynamic price;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? category;
  @HiveField(5)
  String? image;
  @HiveField(6)
  Rating? rating;

  Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
        json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
  
  @override
  List<Object?> get props =>[id,title,price,description,category,image,rating];
}

