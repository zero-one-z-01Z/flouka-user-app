import 'package:flouka/core/helper_function/convert.dart';

import '../../domain/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    super.id,
    super.userId,
    super.subTotal,
    super.tax,
    super.delivery,
    super.discount,
    super.deliveryPrice,
    super.total,
    super.addressId,
    super.paymentMethod,
   required super.status,
    super.createdAt,
    super.updatedAt,
    super.address,
    super.vendorOrders,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      userId: json['user_id'],
      subTotal: (json['sub_total'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      delivery: (json['delivery'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      deliveryPrice: (json['delivery_price'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      addressId: json['address_id'],
      paymentMethod: json['payment_method'],
      status: OrderStatus.getFromString(json['status']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      address: json['address'] != null
          ? AddressModel.fromJson(json['address'])
          : null,
      vendorOrders: json['vendor_orders'] != null
          ? List<VendorOrderModel>.from(
        json['vendor_orders']
            .map((e) => VendorOrderModel.fromJson(e)),
      )
          : [],
    );
  }
}

class AddressModel extends AddressEntity {
  AddressModel({
    super.id,
    super.areaId,
    super.userId,
    super.lat,
    super.lng,
    super.name,
    super.address,
    super.phone,
    super.isDefault,
    super.area,
    super.city,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      areaId: json['area_id'],
      userId: json['user_id'],
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      isDefault: json['default'],
      area: json['area'] != null
          ? AreaModel.fromJson(json['area'])
          : null,
      city: json['city'] != null
          ? CityModel.fromJson(json['city'])
          : null,
    );
  }
}

class AreaModel extends AreaEntity {
  AreaModel({
    super.id,
    super.cityId,
    super.name,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json['id'],
      cityId: json['city_id'],
      name: json['name'],
    );
  }
}

class CityModel extends CityEntity {
  CityModel({
    super.id,
    super.name,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class VendorOrderModel extends VendorOrderEntity {
  VendorOrderModel({
    super.id,
    super.vendor,
    super.store,
    super.status,
    super.subTotal,
    super.tax,
    super.discount,
    super.deliveryPrice,
    super.total,
    super.canRateStore,
    super.items,
  });

  factory VendorOrderModel.fromJson(Map<String, dynamic> json) {
    return VendorOrderModel(
      id: json['id'],
      vendor: json['vendor'] != null
          ? VendorModel.fromJson(json['vendor'])
          : null,
      store: json['store'] != null
          ? StoreModel.fromJson(json['store'])
          : null,
      status: json['status'],
      subTotal: (json['sub_total'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      deliveryPrice: (json['delivery_price'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      canRateStore: json['can_rate_store'],
      items: json['items'] != null
          ? List<OrderItemModel>.from(
        json['items'].map((e) => OrderItemModel.fromJson(e)),
      )
          : [],
    );
  }
}

class VendorModel extends VendorEntity {
  VendorModel({
    super.id,
    super.name,
    super.logo,
    super.bio,
    super.isFavorite,
    super.isFollow,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      bio: json['bio'],
      isFavorite: json['is_favorite'],
      isFollow: json['is_follow'],
    );
  }
}

class StoreModel extends StoreEntity {
  StoreModel({
    super.id,
    super.vendorId,
    super.name,
    super.lat,
    super.lng,
    super.rate,
    super.address,
    super.productsCount,
    super.customersCount,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      vendorId: json['vendor_id'],
      name: json['name'],
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      rate: (json['rate'] as num?)?.toDouble(),
      address: json['address'],
      productsCount: json['products_count'],
      customersCount: json['customers_count'],
    );
  }
}

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    super.id,
    super.productId,
    super.product,
    super.variant,
    super.productVariantId,
    super.quantity,
    super.afterQuantity,
    super.price,
    super.status,
    super.attributes,
    super.canReviewProduct,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      productId: json['product_id'],
      product: json['product'] != null
          ? ProductModel.fromJson(json['product'])
          : null,
      variant: json['variant'] != null
          ? VariantModel.fromJson(json['variant'])
          : null,
      productVariantId: json['product_variant_id'],
      quantity: json['quantity'],
      afterQuantity: json['after_quantity'],
      price: (json['price'] as num?)?.toDouble(),
      status: OrderItemStatus.getFromString(json['status']),
      attributes: json['attributes'],
      canReviewProduct: json['can_review_product'],
    );
  }
}

class ProductModel extends ProductEntity {
  ProductModel({
    super.id,
    super.vendorId,
    super.title,
    super.description,
    super.brandId,
    super.categoryId,
    super.rate,
    super.reviewsCount,
    super.price,
    super.offerPrice,
    super.costPrice,
    super.ordersCount,
    super.sku,
    super.finalPrice,
    super.discountPercentage,
    super.image,
    super.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      vendorId: json['vendor_id'],
      title: json['title'],
      description: json['description'],
      brandId: json['brand_id'],
      categoryId: json['category_id'],
      rate: (json['rate'] as num?)?.toDouble(),
      reviewsCount: json['reviews_count'],
      price: (json['price'] as num?)?.toDouble(),
      offerPrice: (json['offer_price'] as num?)?.toDouble(),
      costPrice: (json['cost_price'] as num?)?.toDouble(),
      ordersCount: json['orders_count'],
      sku: json['sku'],
      finalPrice: (json['final_price'] as num?)?.toDouble(),
      discountPercentage: convertDataToDouble(json['discount_percentage']),
      image: json['image'],
      isFavorite: json['is_favorite'],
    );
  }
}

class VariantModel extends VariantEntity {
  VariantModel({
    super.id,
    super.productId,
    super.name,
    super.sku,
    super.price,
    super.offerPrice,
    super.finalPrice,
  });

  factory VariantModel.fromJson(Map<String, dynamic> json) {
    return VariantModel(
      id: json['id'],
      productId: json['product_id'],
      name: json['name'],
      sku: json['sku'],
      price: (json['price'] as num?)?.toDouble(),
      offerPrice: (json['offer_price'] as num?)?.toDouble(),
      finalPrice: (json['final_price'] as num?)?.toDouble(),
    );
  }
}