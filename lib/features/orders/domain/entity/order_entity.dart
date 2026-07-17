import 'package:flutter/material.dart';
import '../../../../core/constants/app_images.dart';

class OrderEntity {
  final int? id;
  final int? userId;
  final double? subTotal;
  final double? tax;
  final double? delivery;
  final double? discount;
  final double? deliveryPrice;
  final double? total;
  final int? addressId;
  final String? paymentMethod;
  OrderStatus status;
  final String? createdAt;
  final String? updatedAt;
  final AddressEntity? address;
  final List<VendorOrderEntity>? vendorOrders;

  OrderEntity({
    this.id,
    this.userId,
    this.subTotal,
    this.tax,
    this.delivery,
    this.discount,
    this.deliveryPrice,
    this.total,
    this.addressId,
    this.paymentMethod,
   required this.status,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.vendorOrders,
  });

  bool isAnyUnavailable(){
    return vendorOrders?.any(
          (order) => order.items?.any(
            (item) => item.status == OrderItemStatus.outOfStock,
      ) ?? false,
    ) ?? false;  }
}

enum OrderStatus {
  pendingPayment({
    "text": "pending_payment",
    "title": "pending_payment_title",
    "des": "pending_payment_des",
    "color": Color(0xffE9A90A),
    "details_color": Color(0xffE9A90A),
    "image": AppImages.settingsOrders,
    "level": 1,
  }),

  paid({
    "text": "paid",
    "title": "paid_title",
    "des": "paid_des",
    "color": Colors.green,
    "details_color": Colors.green,
    "level": 2,
  }),

  paymentFailed({
    "text": "payment_failed",
    "title": "payment_failed_title",
    "des": "payment_failed_des",
    "color": Color(0xffB03329),
    "details_color": Color(0xffB03329),
    "level": 2,
  }),

  processing({
    "text": "processing",
    "title": "processing_title",
    "des": "processing_des",
    "color": Color(0xff2D40AC),
    "details_color": Color(0xff2D40AC),
    "level": 4,
  }),

  needsUserAction({
    "text": "needs_user_action",
    "title": "needs_user_action_title",
    "des": "needs_user_action_des",
    "color": Color(0xffE9A90A),
    "details_color": Color(0xffE9A90A),
    "level": 5,
  }),

  partiallyFulfilled({
    "text": "partially_fulfilled",
    "title": "partially_fulfilled_title",
    "des": "partially_fulfilled_des",
    "color": Color(0xff2D40AC),
    "details_color": Color(0xff2D40AC),
    "level": 7,
  }),

  fulfilled({
    "text": "fulfilled",
    "title": "fulfilled_title",
    "des": "fulfilled_des",
    "color": Colors.green,
    "details_color": Colors.green,
    "level": 10,
  }),

  cancelled({
    "text": "cancelled",
    "title": "cancelled_title",
    "des": "cancelled_des",
    "color": Color(0xffB03329),
    "details_color": Color(0xffB03329),
    "level": 10,
  }),

  refunded({
    "text": "refunded",
    "title": "refunded_title",
    "des": "refunded_des",
    "color": Color(0xff7D7D7D),
    "details_color": Color(0xff7D7D7D),
    "level": 10,
  });

  final Map<String, dynamic> info;

  const OrderStatus(this.info);

  static OrderStatus getFromString(String? text) {
    return OrderStatus.values.firstWhere(
          (element) => element.info["text"] == text,
      orElse: () => OrderStatus.pendingPayment,
    );
  }

  String get text => info["text"];

  num get level => info["level"];

  String? get image => info["image"];

  String get title => info["title"];

  String get des => info["des"];

  Color get color => info["color"];

  Color get detailsColor => info["details_color"];

  bool get isCancelled =>
      this == OrderStatus.cancelled ||
          this == OrderStatus.paymentFailed ||
          this == OrderStatus.refunded;

  bool get isEnded => this == OrderStatus.fulfilled || this == OrderStatus.refunded

      || this == OrderStatus.cancelled || this == OrderStatus.partiallyFulfilled;

  bool get isActive =>
      !isCancelled && this != OrderStatus.fulfilled;
}

class AddressEntity {
  final int? id;
  final int? areaId;
  final int? userId;
  final double? lat;
  final double? lng;
  final String? name;
  final String? address;
  final String? phone;
  final int? isDefault;
  final AreaEntity? area;
  final CityEntity? city;

  AddressEntity({
    this.id,
    this.areaId,
    this.userId,
    this.lat,
    this.lng,
    this.name,
    this.address,
    this.phone,
    this.isDefault,
    this.area,
    this.city,
  });
}

class AreaEntity {
  final int? id;
  final int? cityId;
  final String? name;

  AreaEntity({
    this.id,
    this.cityId,
    this.name,
  });
}

class CityEntity {
  final int? id;
  final String? name;

  CityEntity({
    this.id,
    this.name,
  });
}

class VendorOrderEntity {
  final int? id;
  final VendorEntity? vendor;
  final StoreEntity? store;
  final String? status;
  final double? subTotal;
  final double? tax;
  final double? discount;
  final double? deliveryPrice;
  final double? total;
  bool? canRateStore;
  final List<OrderItemEntity>? items;

  VendorOrderEntity({
    this.id,
    this.vendor,
    this.store,
    this.status,
    this.subTotal,
    this.tax,
    this.discount,
    this.deliveryPrice,
    this.total,
    this.canRateStore,
    this.items,
  });

  bool isAnyUnavailable(){
    return items?.any((element) => element.status==OrderItemStatus.outOfStock) ??false;
  }

  int get availableItemsCount{
    return items?.where((element) => element.status!=OrderItemStatus.outOfStock).length ??0;
  }

}

class VendorEntity {
  final int? id;
  final String? name;
  final String? logo;
  final String? bio;
  final bool? isFavorite;
  final bool? isFollow;

  VendorEntity({
    this.id,
    this.name,
    this.logo,
    this.bio,
    this.isFavorite,
    this.isFollow,
  });
}

class StoreEntity {
  final int? id;
  final int? vendorId;
  final String? name;
  final double? lat;
  final double? lng;
  final double? rate;
  final String? address;
  final int? productsCount;
  final int? customersCount;

  StoreEntity({
    this.id,
    this.vendorId,
    this.name,
    this.lat,
    this.lng,
    this.rate,
    this.address,
    this.productsCount,
    this.customersCount,
  });
}

class OrderItemEntity {
  final int? id;
  final int? productId;
  final ProductEntity? product;
  final VariantEntity? variant;
  final int? productVariantId;
  final int? quantity;
  final int? afterQuantity;
  final double? price;
  final OrderItemStatus? status;
  final dynamic attributes;
  bool? canReviewProduct;

  OrderItemEntity({
    this.id,
    this.productId,
    this.product,
    this.variant,
    this.productVariantId,
    this.quantity,
    this.afterQuantity,
    this.price,
    this.status,
    this.attributes,
    this.canReviewProduct,
  });

}

class ProductEntity {
  final int? id;
  final int? vendorId;
  final String? title;
  final String? description;
  final int? brandId;
  final int? categoryId;
  final double? rate;
  final int? reviewsCount;
  final double? price;
  final double? offerPrice;
  final double? costPrice;
  final int? ordersCount;
  final String? sku;
  final double? finalPrice;
  final double ? discountPercentage;
  final String? image;
  final bool? isFavorite;

  ProductEntity({
    this.id,
    this.vendorId,
    this.title,
    this.description,
    this.brandId,
    this.categoryId,
    this.rate,
    this.reviewsCount,
    this.price,
    this.offerPrice,
    this.costPrice,
    this.ordersCount,
    this.sku,
    this.finalPrice,
    this.discountPercentage,
    this.image,
    this.isFavorite,
  });
}

class VariantEntity {
  final int? id;
  final int? productId;
  final String? name;
  final String? sku;
  final double? price;
  final double? offerPrice;
  final double? finalPrice;

  VariantEntity({
    this.id,
    this.productId,
    this.name,
    this.sku,
    this.price,
    this.offerPrice,
    this.finalPrice,
  });
}

enum OrderItemStatus {
  pending({
    "text": "pending",
    "title": "pending_title",
    "des": "pending_des",
    "color": Color(0xffE9A90A),
    "details_color": Color(0xffE9A90A),
    "level": 1,
  }),
  confirmed({
    "text": "confirmed",
    "title": "confirmed_title",
    "des": "confirmed_des",
    "color": Color(0xff2D40AC),
    "details_color": Color(0xff2D40AC),
    "level": 2,
  }),
  outOfStock({
    "text": "out_of_stock",
    "title": "out_of_stock_title",
    "des": "out_of_stock_des",
    "color": Color(0xffB03329),
    "details_color": Color(0xffB03329),
    "level": 3,
  }),
  replaced({
    "text": "replaced",
    "title": "replaced_title",
    "des": "replaced_des",
    "color": Color(0xff7D7D7D),
    "details_color": Color(0xff7D7D7D),
    "level": 4,
  }),
  cancelled({
    "text": "cancelled",
    "title": "cancelled_title",
    "des": "cancelled_des",
    "color": Color(0xffB03329),
    "details_color": Color(0xffB03329),
    "level": 10,
  }),
  readyToShip({
    "text": "ready_to_ship",
    "title": "ready_to_ship_title",
    "des": "ready_to_ship_des",
    "color": Color(0xff2D40AC),
    "details_color": Color(0xff2D40AC),
    "level": 5,
  }),
  shipped({
    "text": "shipped",
    "title": "shipped_title",
    "des": "shipped_des",
    "color": Color(0xff2D40AC),
    "details_color": Color(0xff2D40AC),
    "level": 7,
  }),
  delivered({
    "text": "delivered",
    "title": "delivered_title",
    "des": "delivered_des",
    "color": Colors.green,
    "details_color": Colors.green,
    "level": 10,
  });

  final Map<String, dynamic> info;

  const OrderItemStatus(this.info);

  static OrderItemStatus getFromString(String? text) {
    return OrderItemStatus.values.firstWhere(
          (element) => element.info["text"] == text,
      orElse: () => OrderItemStatus.pending,
    );
  }

  String get text => info["text"];

  num get level => info["level"];

  String? get image => info["image"];

  String get title => info["title"];

  String get des => info["des"];

  Color get color => info["color"];

  Color get detailsColor => info["details_color"];

  bool get isCancelled =>
      this == OrderItemStatus.cancelled ||
          this == OrderItemStatus.outOfStock;

  bool get isCompleted =>
      this == OrderItemStatus.delivered;

  bool get isActive =>
      !isCancelled && this != OrderItemStatus.delivered;
}


