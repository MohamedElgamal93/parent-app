// // To parse this JSON data, do
// //
// //     final product = productFromJson(jsonString);

// //import 'dart:convert';
// /*
// Product productFromJson(String str) => Product.fromJson(json.decode(str));

// String productToJson(Product data) => json.encode(data.toJson());
// */
// class Product {
//     Product({
//         this.products,
//         this.params,
//     });

//     List<ProductElement> products;
//     Params params;

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
//         params: Params.fromJson(json["params"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "products": List<dynamic>.from(products.map((x) => x.toJson())),
//         "params": params.toJson(),
//     };
// }

// class Params {
//     Params({
//         this.area,
//         this.useCaching,
//         this.extend,
//         this.customExtend,
//         this.pname,
//         this.pshort,
//         this.pfull,
//         this.pkeywords,
//         this.feature,
//         this.type,
//         this.page,
//         this.action,
//         this.filterVariants,
//         this.featuresHash,
//         this.limit,
//         this.bid,
//         this.match,
//         this.tracking,
//         this.getFrontendUrls,
//         this.itemsPerPage,
//         this.applyDisabledFilters,
//         this.loadProductsExtraData,
//         this.storefront,
//         this.status,
//         this.sortBy,
//         this.sortOrder,
//         this.includeChildVariations,
//         this.groupChildVariations,
//         this.sortOrderRev,
//         this.totalItems,
//     });

//     Area area;
//     bool useCaching;
//     List<String> extend;
//     List<dynamic> customExtend;
//     String pname;
//     String pshort;
//     String pfull;
//     String pkeywords;
//     List<dynamic> feature;
//     String type;
//     int page;
//     String action;
//     List<dynamic> filterVariants;
//     String featuresHash;
//     int limit;
//     int bid;
//     String match;
//     List<dynamic> tracking;
//     bool getFrontendUrls;
//     int itemsPerPage;
//     String applyDisabledFilters;
//     bool loadProductsExtraData;
//     dynamic storefront;
//     Area status;
//     SortBy sortBy;
//     String sortOrder;
//     bool includeChildVariations;
//     bool groupChildVariations;
//     String sortOrderRev;
//     String totalItems;

//     factory Params.fromJson(Map<String, dynamic> json) => Params(
//         area: areaValues.map[json["area"]],
//         useCaching: json["use_caching"],
//         extend: List<String>.from(json["extend"].map((x) => x)),
//         customExtend: List<dynamic>.from(json["custom_extend"].map((x) => x)),
//         pname: json["pname"],
//         pshort: json["pshort"],
//         pfull: json["pfull"],
//         pkeywords: json["pkeywords"],
//         feature: List<dynamic>.from(json["feature"].map((x) => x)),
//         type: json["type"],
//         page: json["page"],
//         action: json["action"],
//         filterVariants: List<dynamic>.from(json["filter_variants"].map((x) => x)),
//         featuresHash: json["features_hash"],
//         limit: json["limit"],
//         bid: json["bid"],
//         match: json["match"],
//         tracking: List<dynamic>.from(json["tracking"].map((x) => x)),
//         getFrontendUrls: json["get_frontend_urls"],
//         itemsPerPage: json["items_per_page"],
//         applyDisabledFilters: json["apply_disabled_filters"],
//         loadProductsExtraData: json["load_products_extra_data"],
//         storefront: json["storefront"],
//         status: areaValues.map[json["status"]],
//         sortBy: sortByValues.map[json["sort_by"]],
//         sortOrder: json["sort_order"],
//         includeChildVariations: json["include_child_variations"],
//         groupChildVariations: json["group_child_variations"],
//         sortOrderRev: json["sort_order_rev"],
//         totalItems: json["total_items"],
//     );

//     Map<String, dynamic> toJson() => {
//         "area": areaValues.reverse[area],
//         "use_caching": useCaching,
//         "extend": List<dynamic>.from(extend.map((x) => x)),
//         "custom_extend": List<dynamic>.from(customExtend.map((x) => x)),
//         "pname": pname,
//         "pshort": pshort,
//         "pfull": pfull,
//         "pkeywords": pkeywords,
//         "feature": List<dynamic>.from(feature.map((x) => x)),
//         "type": type,
//         "page": page,
//         "action": action,
//         "filter_variants": List<dynamic>.from(filterVariants.map((x) => x)),
//         "features_hash": featuresHash,
//         "limit": limit,
//         "bid": bid,
//         "match": match,
//         "tracking": List<dynamic>.from(tracking.map((x) => x)),
//         "get_frontend_urls": getFrontendUrls,
//         "items_per_page": itemsPerPage,
//         "apply_disabled_filters": applyDisabledFilters,
//         "load_products_extra_data": loadProductsExtraData,
//         "storefront": storefront,
//         "status": areaValues.reverse[status],
//         "sort_by": sortByValues.reverse[sortBy],
//         "sort_order": sortOrder,
//         "include_child_variations": includeChildVariations,
//         "group_child_variations": groupChildVariations,
//         "sort_order_rev": sortOrderRev,
//         "total_items": totalItems,
//     };
// }

// enum Area { A, F }

// final areaValues = EnumValues({
//     "A": Area.A,
//     "F": Area.F
// });

// enum SortBy { PRODUCT }

// final sortByValues = EnumValues({
//     "product": SortBy.PRODUCT
// });

// class ProductElement {
//     ProductElement({
//         this.productId,
//         this.product,
//         this.productType,
//         this.parentProductId,
//         this.unitDimension,
//         this.productCode,
//         this.status,
//         this.companyId,
//         this.listPrice,
//         this.amount,
//         this.weight,
//         this.length,
//         this.width,
//         this.height,
//         this.shippingFreight,
//         this.lowAvailLimit,
//         this.timestamp,
//         this.updatedTimestamp,
//         this.usergroupIds,
//         this.isEdp,
//         this.edpShipping,
//         this.unlimitedDownload,
//         this.tracking,
//         this.freeShipping,
//         this.zeroPriceAction,
//         this.isPbp,
//         this.isOp,
//         this.isOper,
//         this.isReturnable,
//         this.returnPeriod,
//         this.availSince,
//         this.outOfStockActions,
//         this.localization,
//         this.minQty,
//         this.maxQty,
//         this.qtyStep,
//         this.listQtyCount,
//         this.taxIds,
//         this.ageVerification,
//         this.ageLimit,
//         this.optionsType,
//         this.exceptionsType,
//         this.detailsLayout,
//         this.shippingParams,
//         this.facebookObjType,
//         this.buyNowUrl,
//         this.cpUpUnitAmount,
//         this.productAmount,
//         this.cpUpRound,
//         this.cpUpVariationType,
//         this.price,
//         this.categoryIds,
//         this.averageRating,
//         this.discussionType,
//         this.discussionThreadId,
//         this.mainCategory,
//         this.abVgVideos,
//         this.variationFeatures,
//         this.mainPair,
//         this.basePrice,
//         this.selectedOptions,
//         this.hasOptions,
//         this.productOptions,
//         this.discounts,
//         this.productFeatures,
//         this.qtyContent,
//         this.premoderationReason,
//     });

//     String productId;
//     String product;
//     OptionsType productType;
//     String parentProductId;
//     UnitDimension unitDimension;
//     String productCode;
//     Area status;
//     String companyId;
//     String listPrice;
//     String amount;
//     String weight;
//     String length;
//     String width;
//     String height;
//     String shippingFreight;
//     String lowAvailLimit;
//     String timestamp;
//     String updatedTimestamp;
//     String usergroupIds;
//     AgeVerification isEdp;
//     AgeVerification edpShipping;
//     AgeVerification unlimitedDownload;
//     AgeVerification tracking;
//     AgeVerification freeShipping;
//     OptionsType zeroPriceAction;
//     AgeVerification isPbp;
//     AgeVerification isOp;
//     AgeVerification isOper;
//     CpUpRound isReturnable;
//     String returnPeriod;
//     String availSince;
//     AgeVerification outOfStockActions;
//     String localization;
//     String minQty;
//     String maxQty;
//     String qtyStep;
//     String listQtyCount;
//     String taxIds;
//     AgeVerification ageVerification;
//     String ageLimit;
//     OptionsType optionsType;
//     Area exceptionsType;
//     DetailsLayout detailsLayout;
//     String shippingParams;
//     FacebookObjType facebookObjType;
//     String buyNowUrl;
//     String cpUpUnitAmount;
//     String productAmount;
//     CpUpRound cpUpRound;
//     Type cpUpVariationType;
//     String price;
//     List<int> categoryIds;
//     dynamic averageRating;
//     DiscussionType discussionType;
//     String discussionThreadId;
//     int mainCategory;
//     bool abVgVideos;
//     List<dynamic> variationFeatures;
//     MainPair mainPair;
//     String basePrice;
//     List<dynamic> selectedOptions;
//     bool hasOptions;
//     List<dynamic> productOptions;
//     Discounts discounts;
//     dynamic productFeatures;
//     List<dynamic> qtyContent;
//     String premoderationReason;

//     factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
//         productId: json["product_id"],
//         product: json["product"],
//         productType: optionsTypeValues.map[json["product_type"]],
//         parentProductId: json["parent_product_id"],
//         unitDimension: unitDimensionValues.map[json["unit_dimension"]],
//         productCode: json["product_code"],
//         status: areaValues.map[json["status"]],
//         companyId: json["company_id"],
//         listPrice: json["list_price"],
//         amount: json["amount"],
//         weight: json["weight"],
//         length: json["length"],
//         width: json["width"],
//         height: json["height"],
//         shippingFreight: json["shipping_freight"],
//         lowAvailLimit: json["low_avail_limit"],
//         timestamp: json["timestamp"],
//         updatedTimestamp: json["updated_timestamp"],
//         usergroupIds: json["usergroup_ids"],
//         isEdp: ageVerificationValues.map[json["is_edp"]],
//         edpShipping: ageVerificationValues.map[json["edp_shipping"]],
//         unlimitedDownload: ageVerificationValues.map[json["unlimited_download"]],
//         tracking: ageVerificationValues.map[json["tracking"]],
//         freeShipping: ageVerificationValues.map[json["free_shipping"]],
//         zeroPriceAction: optionsTypeValues.map[json["zero_price_action"]],
//         isPbp: ageVerificationValues.map[json["is_pbp"]],
//         isOp: ageVerificationValues.map[json["is_op"]],
//         isOper: ageVerificationValues.map[json["is_oper"]],
//         isReturnable: cpUpRoundValues.map[json["is_returnable"]],
//         returnPeriod: json["return_period"],
//         availSince: json["avail_since"],
//         outOfStockActions: ageVerificationValues.map[json["out_of_stock_actions"]],
//         localization: json["localization"],
//         minQty: json["min_qty"],
//         maxQty: json["max_qty"],
//         qtyStep: json["qty_step"],
//         listQtyCount: json["list_qty_count"],
//         taxIds: json["tax_ids"],
//         ageVerification: ageVerificationValues.map[json["age_verification"]],
//         ageLimit: json["age_limit"],
//         optionsType: optionsTypeValues.map[json["options_type"]],
//         exceptionsType: areaValues.map[json["exceptions_type"]],
//         detailsLayout: detailsLayoutValues.map[json["details_layout"]],
//         shippingParams: json["shipping_params"],
//         facebookObjType: facebookObjTypeValues.map[json["facebook_obj_type"]],
//         buyNowUrl: json["buy_now_url"],
//         cpUpUnitAmount: json["cp_up_unit_amount"],
//         productAmount: json["product_amount"],
//         cpUpRound: cpUpRoundValues.map[json["cp_up_round"]],
//         cpUpVariationType: typeValues.map[json["cp_up_variation_type"]],
//         price: json["price"],
//         categoryIds: List<int>.from(json["category_ids"].map((x) => x)),
//         averageRating: json["average_rating"],
//         discussionType: discussionTypeValues.map[json["discussion_type"]],
//         discussionThreadId: json["discussion_thread_id"],
//         mainCategory: json["main_category"],
//         abVgVideos: json["ab__vg_videos"],
//         variationFeatures: List<dynamic>.from(json["variation_features"].map((x) => x)),
//         mainPair: MainPair.fromJson(json["main_pair"]),
//         basePrice: json["base_price"],
//         selectedOptions: List<dynamic>.from(json["selected_options"].map((x) => x)),
//         hasOptions: json["has_options"],
//         productOptions: List<dynamic>.from(json["product_options"].map((x) => x)),
//         discounts: Discounts.fromJson(json["discounts"]),
//         productFeatures: json["product_features"],
//         qtyContent: List<dynamic>.from(json["qty_content"].map((x) => x)),
//         premoderationReason: json["premoderation_reason"],
//     );

//     Map<String, dynamic> toJson() => {
//         "product_id": productId,
//         "product": product,
//         "product_type": optionsTypeValues.reverse[productType],
//         "parent_product_id": parentProductId,
//         "unit_dimension": unitDimensionValues.reverse[unitDimension],
//         "product_code": productCode,
//         "status": areaValues.reverse[status],
//         "company_id": companyId,
//         "list_price": listPrice,
//         "amount": amount,
//         "weight": weight,
//         "length": length,
//         "width": width,
//         "height": height,
//         "shipping_freight": shippingFreight,
//         "low_avail_limit": lowAvailLimit,
//         "timestamp": timestamp,
//         "updated_timestamp": updatedTimestamp,
//         "usergroup_ids": usergroupIds,
//         "is_edp": ageVerificationValues.reverse[isEdp],
//         "edp_shipping": ageVerificationValues.reverse[edpShipping],
//         "unlimited_download": ageVerificationValues.reverse[unlimitedDownload],
//         "tracking": ageVerificationValues.reverse[tracking],
//         "free_shipping": ageVerificationValues.reverse[freeShipping],
//         "zero_price_action": optionsTypeValues.reverse[zeroPriceAction],
//         "is_pbp": ageVerificationValues.reverse[isPbp],
//         "is_op": ageVerificationValues.reverse[isOp],
//         "is_oper": ageVerificationValues.reverse[isOper],
//         "is_returnable": cpUpRoundValues.reverse[isReturnable],
//         "return_period": returnPeriod,
//         "avail_since": availSince,
//         "out_of_stock_actions": ageVerificationValues.reverse[outOfStockActions],
//         "localization": localization,
//         "min_qty": minQty,
//         "max_qty": maxQty,
//         "qty_step": qtyStep,
//         "list_qty_count": listQtyCount,
//         "tax_ids": taxIds,
//         "age_verification": ageVerificationValues.reverse[ageVerification],
//         "age_limit": ageLimit,
//         "options_type": optionsTypeValues.reverse[optionsType],
//         "exceptions_type": areaValues.reverse[exceptionsType],
//         "details_layout": detailsLayoutValues.reverse[detailsLayout],
//         "shipping_params": shippingParams,
//         "facebook_obj_type": facebookObjTypeValues.reverse[facebookObjType],
//         "buy_now_url": buyNowUrl,
//         "cp_up_unit_amount": cpUpUnitAmount,
//         "product_amount": productAmount,
//         "cp_up_round": cpUpRoundValues.reverse[cpUpRound],
//         "cp_up_variation_type": typeValues.reverse[cpUpVariationType],
//         "price": price,
//         "category_ids": List<dynamic>.from(categoryIds.map((x) => x)),
//         "average_rating": averageRating,
//         "discussion_type": discussionTypeValues.reverse[discussionType],
//         "discussion_thread_id": discussionThreadId,
//         "main_category": mainCategory,
//         "ab__vg_videos": abVgVideos,
//         "variation_features": List<dynamic>.from(variationFeatures.map((x) => x)),
//         "main_pair": mainPair.toJson(),
//         "base_price": basePrice,
//         "selected_options": List<dynamic>.from(selectedOptions.map((x) => x)),
//         "has_options": hasOptions,
//         "product_options": List<dynamic>.from(productOptions.map((x) => x)),
//         "discounts": discounts.toJson(),
//         "product_features": productFeatures,
//         "qty_content": List<dynamic>.from(qtyContent.map((x) => x)),
//         "premoderation_reason": premoderationReason,
//     };
// }

// enum AgeVerification { N, S, B }

// final ageVerificationValues = EnumValues({
//     "B": AgeVerification.B,
//     "N": AgeVerification.N,
//     "S": AgeVerification.S
// });

// enum CpUpRound { Y, N }

// final cpUpRoundValues = EnumValues({
//     "N": CpUpRound.N,
//     "Y": CpUpRound.Y
// });

// enum Type { M }

// final typeValues = EnumValues({
//     "M": Type.M
// });

// enum DetailsLayout { DEFAULT, EMPTY }

// final detailsLayoutValues = EnumValues({
//     "default": DetailsLayout.DEFAULT,
//     "": DetailsLayout.EMPTY
// });

// class Discounts {
//     Discounts({
//         this.a,
//         this.p,
//     });

//     int a;
//     int p;

//     factory Discounts.fromJson(Map<String, dynamic> json) => Discounts(
//         a: json["A"],
//         p: json["P"],
//     );

//     Map<String, dynamic> toJson() => {
//         "A": a,
//         "P": p,
//     };
// }

// enum DiscussionType { D }

// final discussionTypeValues = EnumValues({
//     "D": DiscussionType.D
// });

// enum FacebookObjType { ACTIVITY, EMPTY }

// final facebookObjTypeValues = EnumValues({
//     "activity": FacebookObjType.ACTIVITY,
//     "": FacebookObjType.EMPTY
// });

// class MainPair {
//     MainPair({
//         this.pairId,
//         this.imageId,
//         this.detailedId,
//         this.position,
//         this.objectId,
//         this.objectType,
//         this.detailed,
//     });

//     String pairId;
//     String imageId;
//     String detailedId;
//     String position;
//     String objectId;
//     SortBy objectType;
//     Detailed detailed;

//     factory MainPair.fromJson(Map<String, dynamic> json) => MainPair(
//         pairId: json["pair_id"],
//         imageId: json["image_id"],
//         detailedId: json["detailed_id"],
//         position: json["position"],
//         objectId: json["object_id"],
//         objectType: sortByValues.map[json["object_type"]],
//         detailed: Detailed.fromJson(json["detailed"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "pair_id": pairId,
//         "image_id": imageId,
//         "detailed_id": detailedId,
//         "position": position,
//         "object_id": objectId,
//         "object_type": sortByValues.reverse[objectType],
//         "detailed": detailed.toJson(),
//     };
// }

// class Detailed {
//     Detailed({
//         this.objectId,
//         this.objectType,
//         this.type,
//         this.imagePath,
//         this.alt,
//         this.imageX,
//         this.imageY,
//         this.httpImagePath,
//         this.httpsImagePath,
//         this.absolutePath,
//         this.relativePath,
//         this.isHighRes,
//     });

//     String objectId;
//     SortBy objectType;
//     Type type;
//     String imagePath;
//     String alt;
//     String imageX;
//     String imageY;
//     String httpImagePath;
//     String httpsImagePath;
//     String absolutePath;
//     String relativePath;
//     bool isHighRes;

//     factory Detailed.fromJson(Map<String, dynamic> json) => Detailed(
//         objectId: json["object_id"],
//         objectType: sortByValues.map[json["object_type"]],
//         type: typeValues.map[json["type"]],
//         imagePath: json["image_path"],
//         alt: json["alt"],
//         imageX: json["image_x"],
//         imageY: json["image_y"],
//         httpImagePath: json["http_image_path"],
//         httpsImagePath: json["https_image_path"],
//         absolutePath: json["absolute_path"],
//         relativePath: json["relative_path"],
//         isHighRes: json["is_high_res"],
//     );

//     Map<String, dynamic> toJson() => {
//         "object_id": objectId,
//         "object_type": sortByValues.reverse[objectType],
//         "type": typeValues.reverse[type],
//         "image_path": imagePath,
//         "alt": alt,
//         "image_x": imageX,
//         "image_y": imageY,
//         "http_image_path": httpImagePath,
//         "https_image_path": httpsImagePath,
//         "absolute_path": absolutePath,
//         "relative_path": relativePath,
//         "is_high_res": isHighRes,
//     };
// }

// enum OptionsType { P, R }

// final optionsTypeValues = EnumValues({
//     "P": OptionsType.P,
//     "R": OptionsType.R
// });

// class ProductFeaturesClass {
//     ProductFeaturesClass({
//         this.the1,
//     });

//     ProductFeatures1 the1;

//     factory ProductFeaturesClass.fromJson(Map<String, dynamic> json) => ProductFeaturesClass(
//         the1: ProductFeatures1.fromJson(json["1"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "1": the1.toJson(),
//     };
// }

// class ProductFeatures1 {
//     ProductFeatures1({
//         this.featureId,
//         this.value,
//         this.valueInt,
//         this.variantId,
//         this.featureType,
//         this.description,
//         this.prefix,
//         this.suffix,
//         this.variant,
//         this.parentId,
//         this.displayOnHeader,
//         this.displayOnCatalog,
//         this.displayOnProduct,
//         this.featureCode,
//         this.variants,
//     });

//     String featureId;
//     String value;
//     dynamic valueInt;
//     String variantId;
//     String featureType;
//     String description;
//     String prefix;
//     String suffix;
//     String variant;
//     String parentId;
//     AgeVerification displayOnHeader;
//     CpUpRound displayOnCatalog;
//     CpUpRound displayOnProduct;
//     String featureCode;
//     Variants variants;

//     factory ProductFeatures1.fromJson(Map<String, dynamic> json) => ProductFeatures1(
//         featureId: json["feature_id"],
//         value: json["value"],
//         valueInt: json["value_int"],
//         variantId: json["variant_id"],
//         featureType: json["feature_type"],
//         description: json["description"],
//         prefix: json["prefix"],
//         suffix: json["suffix"],
//         variant: json["variant"],
//         parentId: json["parent_id"],
//         displayOnHeader: ageVerificationValues.map[json["display_on_header"]],
//         displayOnCatalog: cpUpRoundValues.map[json["display_on_catalog"]],
//         displayOnProduct: cpUpRoundValues.map[json["display_on_product"]],
//         featureCode: json["feature_code"],
//         variants: Variants.fromJson(json["variants"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "feature_id": featureId,
//         "value": value,
//         "value_int": valueInt,
//         "variant_id": variantId,
//         "feature_type": featureType,
//         "description": description,
//         "prefix": prefix,
//         "suffix": suffix,
//         "variant": variant,
//         "parent_id": parentId,
//         "display_on_header": ageVerificationValues.reverse[displayOnHeader],
//         "display_on_catalog": cpUpRoundValues.reverse[displayOnCatalog],
//         "display_on_product": cpUpRoundValues.reverse[displayOnProduct],
//         "feature_code": featureCode,
//         "variants": variants.toJson(),
//     };
// }

// class Variants {
//     Variants({
//         this.the1,
//     });

//     Variants1 the1;

//     factory Variants.fromJson(Map<String, dynamic> json) => Variants(
//         the1: Variants1.fromJson(json["1"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "1": the1.toJson(),
//     };
// }

// class Variants1 {
//     Variants1({
//         this.value,
//         this.valueInt,
//         this.variantId,
//         this.variant,
//         this.imagePairs,
//     });

//     String value;
//     dynamic valueInt;
//     String variantId;
//     String variant;
//     bool imagePairs;

//     factory Variants1.fromJson(Map<String, dynamic> json) => Variants1(
//         value: json["value"],
//         valueInt: json["value_int"],
//         variantId: json["variant_id"],
//         variant: json["variant"],
//         imagePairs: json["image_pairs"],
//     );

//     Map<String, dynamic> toJson() => {
//         "value": value,
//         "value_int": valueInt,
//         "variant_id": variantId,
//         "variant": variant,
//         "image_pairs": imagePairs,
//     };
// }

// enum UnitDimension { ML, EMPTY }

// final unitDimensionValues = EnumValues({
//     "": UnitDimension.EMPTY,
//     "ml": UnitDimension.ML
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }

// abstract class ProuductRepoInterface{
//   Future<Product> productLogin(String url);
// }