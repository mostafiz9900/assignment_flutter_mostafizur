// To parse this JSON data, do
//
//     final productResponse = productResponseFromMap(jsonString);

import 'dart:convert';

List<ProductResponse> productResponseFromMap(dynamic str) => List<ProductResponse>.from(json.decode(str).map((x) => ProductResponse.fromMap(x)));

String productResponseToMap(List<ProductResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProductResponse {
  final int? id;
  final String? name;
  final String? slug;
  final String? postAuthor;
  final String? permalink;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final String? type;
  final String? status;
  final bool? featured;
  final String? catalogVisibility;
  final String? description;
  final String? shortDescription;
  final String? sku;
  final String? price;
  final String? regularPrice;
  final String? salePrice;
  final dynamic dateOnSaleFrom;
  final dynamic dateOnSaleFromGmt;
  final dynamic dateOnSaleTo;
  final dynamic dateOnSaleToGmt;
  final String? priceHtml;
  final bool? onSale;
  final bool? purchasable;
  final int? totalSales;
  final bool? virtual;
  final bool? downloadable;
  final List<Download>? downloads;
  final int? downloadLimit;
  final int? downloadExpiry;
  final String? externalUrl;
  final String? buttonText;
  final String? taxStatus;
  final String? taxClass;
  final bool? manageStock;
  final dynamic stockQuantity;
  final dynamic lowStockAmount;
  final bool? inStock;
  final String? backorders;
  final bool? backordersAllowed;
  final bool? backordered;
  final bool? soldIndividually;
  final String? weight;
  final Dimensions? dimensions;
  final bool? shippingRequired;
  final bool? shippingTaxable;
  final String? shippingClass;
  final int? shippingClassId;
  final bool? reviewsAllowed;
  final String? averageRating;
  final int? ratingCount;
  final List<int>? relatedIds;
  final List<dynamic>? upsellIds;
  final List<dynamic>? crossSellIds;
  final int? parentId;
  final String? purchaseNote;
  final List<Category>? categories;
  final List<dynamic>? tags;
  final List<Image>? images;
  final List<dynamic>? attributes;
  final List<dynamic>? defaultAttributes;
  final List<dynamic>? variations;
  final List<dynamic>? groupedProducts;
  final int? menuOrder;
  final List<MetaDatum>? metaData;
  final Store? store;
  final Links? links;

  ProductResponse({
    this.id,
    this.name,
    this.slug,
    this.postAuthor,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.priceHtml,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.externalUrl,
    this.buttonText,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.lowStockAmount,
    this.inStock,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.soldIndividually,
    this.weight,
    this.dimensions,
    this.shippingRequired,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.relatedIds,
    this.upsellIds,
    this.crossSellIds,
    this.parentId,
    this.purchaseNote,
    this.categories,
    this.tags,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.variations,
    this.groupedProducts,
    this.menuOrder,
    this.metaData,
    this.store,
    this.links,
  });

  factory ProductResponse.fromMap(Map<String, dynamic> json) => ProductResponse(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    postAuthor: json["post_author"],
    permalink: json["permalink"],
    dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
    dateCreatedGmt: json["date_created_gmt"] == null ? null : DateTime.parse(json["date_created_gmt"]),
    dateModified: json["date_modified"] == null ? null : DateTime.parse(json["date_modified"]),
    dateModifiedGmt: json["date_modified_gmt"] == null ? null : DateTime.parse(json["date_modified_gmt"]),
    type: json["type"],
    status: json["status"],
    featured: json["featured"],
    catalogVisibility: json["catalog_visibility"],
    description: json["description"],
    shortDescription: json["short_description"],
    sku: json["sku"],
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    dateOnSaleFrom: json["date_on_sale_from"],
    dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
    dateOnSaleTo: json["date_on_sale_to"],
    dateOnSaleToGmt: json["date_on_sale_to_gmt"],
    priceHtml: json["price_html"],
    onSale: json["on_sale"],
    purchasable: json["purchasable"],
    totalSales: json["total_sales"],
    virtual: json["virtual"],
    downloadable: json["downloadable"],
    downloads: json["downloads"] == null ? [] : List<Download>.from(json["downloads"]!.map((x) => Download.fromMap(x))),
    downloadLimit: json["download_limit"],
    downloadExpiry: json["download_expiry"],
    externalUrl: json["external_url"],
    buttonText: json["button_text"],
    taxStatus: json["tax_status"],
    taxClass: json["tax_class"],
    manageStock: json["manage_stock"],
    stockQuantity: json["stock_quantity"],
    lowStockAmount: json["low_stock_amount"],
    inStock: json["in_stock"],
    backorders: json["backorders"],
    backordersAllowed: json["backorders_allowed"],
    backordered: json["backordered"],
    soldIndividually: json["sold_individually"],
    weight: json["weight"],
    dimensions: json["dimensions"] == null ? null : Dimensions.fromMap(json["dimensions"]),
    shippingRequired: json["shipping_required"],
    shippingTaxable: json["shipping_taxable"],
    shippingClass: json["shipping_class"],
    shippingClassId: json["shipping_class_id"],
    reviewsAllowed: json["reviews_allowed"],
    averageRating: json["average_rating"],
    ratingCount: json["rating_count"],
    relatedIds: json["related_ids"] == null ? [] : List<int>.from(json["related_ids"]!.map((x) => x)),
    upsellIds: json["upsell_ids"] == null ? [] : List<dynamic>.from(json["upsell_ids"]!.map((x) => x)),
    crossSellIds: json["cross_sell_ids"] == null ? [] : List<dynamic>.from(json["cross_sell_ids"]!.map((x) => x)),
    parentId: json["parent_id"],
    purchaseNote: json["purchase_note"],
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromMap(x))),
    tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
    images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromMap(x))),
    attributes: json["attributes"] == null ? [] : List<dynamic>.from(json["attributes"]!.map((x) => x)),
    defaultAttributes: json["default_attributes"] == null ? [] : List<dynamic>.from(json["default_attributes"]!.map((x) => x)),
    variations: json["variations"] == null ? [] : List<dynamic>.from(json["variations"]!.map((x) => x)),
    groupedProducts: json["grouped_products"] == null ? [] : List<dynamic>.from(json["grouped_products"]!.map((x) => x)),
    menuOrder: json["menu_order"],
    metaData: json["meta_data"] == null ? [] : List<MetaDatum>.from(json["meta_data"]!.map((x) => MetaDatum.fromMap(x))),
    store: json["store"] == null ? null : Store.fromMap(json["store"]),
    links: json["_links"] == null ? null : Links.fromMap(json["_links"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "slug": slug,
    "post_author": postAuthor,
    "permalink": permalink,
    "date_created": dateCreated?.toIso8601String(),
    "date_created_gmt": dateCreatedGmt?.toIso8601String(),
    "date_modified": dateModified?.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
    "type": type,
    "status": status,
    "featured": featured,
    "catalog_visibility": catalogVisibility,
    "description": description,
    "short_description": shortDescription,
    "sku": sku,
    "price": price,
    "regular_price": regularPrice,
    "sale_price": salePrice,
    "date_on_sale_from": dateOnSaleFrom,
    "date_on_sale_from_gmt": dateOnSaleFromGmt,
    "date_on_sale_to": dateOnSaleTo,
    "date_on_sale_to_gmt": dateOnSaleToGmt,
    "price_html": priceHtml,
    "on_sale": onSale,
    "purchasable": purchasable,
    "total_sales": totalSales,
    "virtual": virtual,
    "downloadable": downloadable,
    "downloads": downloads == null ? [] : List<dynamic>.from(downloads!.map((x) => x.toMap())),
    "download_limit": downloadLimit,
    "download_expiry": downloadExpiry,
    "external_url": externalUrl,
    "button_text": buttonText,
    "tax_status": taxStatus,
    "tax_class": taxClass,
    "manage_stock": manageStock,
    "stock_quantity": stockQuantity,
    "low_stock_amount": lowStockAmount,
    "in_stock": inStock,
    "backorders": backorders,
    "backorders_allowed": backordersAllowed,
    "backordered": backordered,
    "sold_individually": soldIndividually,
    "weight": weight,
    "dimensions": dimensions?.toMap(),
    "shipping_required": shippingRequired,
    "shipping_taxable": shippingTaxable,
    "shipping_class": shippingClass,
    "shipping_class_id": shippingClassId,
    "reviews_allowed": reviewsAllowed,
    "average_rating": averageRating,
    "rating_count": ratingCount,
    "related_ids": relatedIds == null ? [] : List<dynamic>.from(relatedIds!.map((x) => x)),
    "upsell_ids": upsellIds == null ? [] : List<dynamic>.from(upsellIds!.map((x) => x)),
    "cross_sell_ids": crossSellIds == null ? [] : List<dynamic>.from(crossSellIds!.map((x) => x)),
    "parent_id": parentId,
    "purchase_note": purchaseNote,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toMap())),
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toMap())),
    "attributes": attributes == null ? [] : List<dynamic>.from(attributes!.map((x) => x)),
    "default_attributes": defaultAttributes == null ? [] : List<dynamic>.from(defaultAttributes!.map((x) => x)),
    "variations": variations == null ? [] : List<dynamic>.from(variations!.map((x) => x)),
    "grouped_products": groupedProducts == null ? [] : List<dynamic>.from(groupedProducts!.map((x) => x)),
    "menu_order": menuOrder,
    "meta_data": metaData == null ? [] : List<dynamic>.from(metaData!.map((x) => x.toMap())),
    "store": store?.toMap(),
    "_links": links?.toMap(),
  };

}

class Category {
  final int? id;
  final String? name;
  final String? slug;

  Category({
    this.id,
    this.name,
    this.slug,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "slug": slug,
  };
}

class Dimensions {
  final String? length;
  final String? width;
  final String? height;

  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  factory Dimensions.fromMap(Map<String, dynamic> json) => Dimensions(
    length: json["length"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toMap() => {
    "length": length,
    "width": width,
    "height": height,
  };
}

class Download {
  final String? id;
  final String? name;
  final String? file;

  Download({
    this.id,
    this.name,
    this.file,
  });

  factory Download.fromMap(Map<String, dynamic> json) => Download(
    id: json["id"],
    name: json["name"],
    file: json["file"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "file": file,
  };
}

class Image {
  final int? id;
  final DateTime? dateCreated;
  final DateTime? dateCreatedGmt;
  final DateTime? dateModified;
  final DateTime? dateModifiedGmt;
  final String? src;
  final String? name;
  final String? alt;
  final int? position;

  Image({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
    this.position,
  });

  factory Image.fromMap(Map<String, dynamic> json) => Image(
    id: json["id"],
    dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
    dateCreatedGmt: json["date_created_gmt"] == null ? null : DateTime.parse(json["date_created_gmt"]),
    dateModified: json["date_modified"] == null ? null : DateTime.parse(json["date_modified"]),
    dateModifiedGmt: json["date_modified_gmt"] == null ? null : DateTime.parse(json["date_modified_gmt"]),
    src: json["src"],
    name: json["name"],
    alt: json["alt"],
    position: json["position"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "date_created": dateCreated?.toIso8601String(),
    "date_created_gmt": dateCreatedGmt?.toIso8601String(),
    "date_modified": dateModified?.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
    "src": src,
    "name": name,
    "alt": alt,
    "position": position,
  };
}

class Links {
  final List<Collection>? self;
  final List<Collection>? collection;

  Links({
    this.self,
    this.collection,
  });

  factory Links.fromMap(Map<String, dynamic> json) => Links(
    self: json["self"] == null ? [] : List<Collection>.from(json["self"]!.map((x) => Collection.fromMap(x))),
    collection: json["collection"] == null ? [] : List<Collection>.from(json["collection"]!.map((x) => Collection.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "self": self == null ? [] : List<dynamic>.from(self!.map((x) => x.toMap())),
    "collection": collection == null ? [] : List<dynamic>.from(collection!.map((x) => x.toMap())),
  };
}

class Collection {
  final String? href;

  Collection({
    this.href,
  });

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
    href: json["href"],
  );

  Map<String, dynamic> toMap() => {
    "href": href,
  };
}

class MetaDatum {
  final int? id;
  final String? key;
  final dynamic value;

  MetaDatum({
    this.id,
    this.key,
    this.value,
  });

  factory MetaDatum.fromMap(Map<String, dynamic> json) => MetaDatum(
    id: json["id"],
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "key": key,
    "value": value,
  };
}

class Store {
  final int? id;
  final String? name;
  final String? url;
  final String? avatar;
  final Address? address;

  Store({
    this.id,
    this.name,
    this.url,
    this.avatar,
    this.address,
  });

  factory Store.fromMap(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
    url: json["url"],
    avatar: json["avatar"],
    address: json["address"] == null ? null : Address.fromMap(json["address"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "url": url,
    "avatar": avatar,
    "address": address?.toMap(),
  };
}

class Address {
  final String? street1;
  final String? street2;
  final String? city;
  final String? zip;
  final String? country;
  final String? state;

  Address({
    this.street1,
    this.street2,
    this.city,
    this.zip,
    this.country,
    this.state,
  });

  factory Address.fromMap(Map<String, dynamic> json) => Address(
    street1: json["street_1"],
    street2: json["street_2"],
    city: json["city"],
    zip: json["zip"],
    country: json["country"],
    state: json["state"],
  );

  Map<String, dynamic> toMap() => {
    "street_1": street1,
    "street_2": street2,
    "city": city,
    "zip": zip,
    "country": country,
    "state": state,
  };
}
