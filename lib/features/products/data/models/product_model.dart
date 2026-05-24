import 'dart:developer';
import 'package:flouka/core/helper_function/convert.dart';
import 'package:flouka/features/products/data/models/attribute_model.dart';
import 'package:flouka/features/products/data/models/product_review_model.dart';
import 'package:flouka/features/products/data/models/variant_model.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';

import '../../../reels/data/models/reel_model.dart';


class ProductModel extends ProductEntity {
  ProductModel({
    super.id,
    super.title,
    super.description,
    required super.recommended,
    required super.image,
    super.price,
    super.offerPrice,
    required super.images,
    super.rate,
    required super.reviews,
    super.isFavorite,
    required super.store,
    required super.related,
    required super.reviewImages,
    required super.discountTitle,
    required super.discountPercentage, required super.attributes, required super.variants,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<ProductImageModel> images=[];
    List<ProductModel> recommendedProduct=[];
    List<RelatedModel> relatedProduct=[];
    List<ProductImageModel> reviewsImages=[];
    List<ProductReviewModel> reviews=[];
    List<AttributeModel> attributes =[];
    List<VariantModel> variants =[];

    if(json['images'] !=null){
      for(var element in json['images']){
        images.add(ProductImageModel.fromJson(element));
      }
    }
    if(json['review_images'] !=null){
      for(var element in json['review_images']){
        reviewsImages.add(ProductImageModel.fromJson(element));
      }
    }

    if(json['reviews'] !=null){
      for(var element in json['reviews']){
        reviews.add(ProductReviewModel.fromJson(element));
      }
    }
    if(json['attributes'] !=null){
      for(var element in json['attributes']){
        attributes.add(AttributeModel.fromJson(element));
      }
    }
    if(json['variants'] !=null){
      for(var element in json['variants']){
        variants.add(VariantModel.fromJson(element));
      }
    }

    if(json['recommended'] !=null){
      for(var element in json['recommended']){
        recommendedProduct.add(ProductModel.fromJson(element));
      }
    }

    if(json['related_products'] !=null){
      for(var element in json['related_products']){
        relatedProduct.add(RelatedModel.fromJson(element));
      }
    }


    try {
      return ProductModel(
        id: json['id'],
        title: json['title'] ?? "",
        description: json['description'] ?? "",
        image: json['image'] ,
        price: convertDataToNum(json['price']),
        offerPrice: convertDataToNum(json['offer_price']),
        reviewImages: reviewsImages,
        reviews: reviews,
        attributes: attributes,
        images: images,
        rate: json['rate'] != null
            ? convertDataToNum(json['rate'])
            : null,
        isFavorite: json['is_favorite'] ?? false,
        discountTitle: json['discount_title'] ?? "",
        discountPercentage: convertDataToNum(json['discount_percentage']) ?? 0,
        store:json['store'] !=null ? StoreModel.fromJson(json['store']) : null,
        related: relatedProduct,
        recommended: recommendedProduct,
        variants: variants,
      );
    } catch (e, l) {
      log(l.toString());
      log(e.toString());
      throw e;
    }
  }
}

class ProductImageModel extends ProductImage {
  const ProductImageModel({
    required super.image,
    required super.id
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    try {
      return ProductImageModel(image: json['image'],id: json['id'],);
    } catch (e, l) {
      log(l.toString());
      log(e.toString());
      throw e;
    }
  }
}

class StoreModel extends StoreEntity {
  const StoreModel({
    required super.name,
    required super.id,
    required super.logo,
    required super.vendor,
    required super.vendorId,required super.lat,required super.lng,required super.rate,required super.address,
    required super.productsCount,required super.customersCount,required super.distance,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    try {
      return StoreModel(id: json['id'],
      logo: json['cover']??"",
      vendor: json['vendor'] !=null ? VendorModel.fromJson(json['vendor']) : null,
      vendorId: json['vendor_id'],lat: json['lat'],lng: json['lng'],rate: json['rate'],address: json['address'],
      productsCount: json['products_count'],customersCount: json['customers_count'],distance: json['distance'],
      name: json['name'],);
    } catch (e, l) {
      log(l.toString());
      log(e.toString());
      throw e;
    }
  }
}

class RelatedModel extends RelatedEntity {
  const RelatedModel({
    required super.id,
    required super.title,
    required super.image,
    required super.description,
    required super.finalPrice,
  });

  factory RelatedModel.fromJson(Map<String, dynamic> json) {
    try {
      return RelatedModel(id: json['id'], title: json['title'], description: json['description'],
          image: json['image']??"https://en.wikipedia.org/wiki/File:Image_created_with_a_mobile_phone.png",
          finalPrice: json['final_price']);
    } catch (e, l) {
      log("${l.toString()}");
      log(e.toString());
      throw e;
    }
  }
}
