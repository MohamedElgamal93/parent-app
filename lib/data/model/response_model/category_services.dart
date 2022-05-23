class CategoryServices {
  CategoryServices({
    required this.data,
  });
  late final List<Data> data;
  
  CategoryServices.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.categoryName,
    required this.categorySlug,
    required this.categoryThumb,
    required this.categoryThumbAlt,
    required this.services,
  });
  late final String categoryName;
  late final String categorySlug;
  late final String categoryThumb;
  late final String categoryThumbAlt;
  late final List<Services> services;
  
  Data.fromJson(Map<String, dynamic> json){
    categoryName = json['category_name'];
    categorySlug = json['category_slug'];
    categoryThumb = json['category_thumb'];
    categoryThumbAlt = json['category_thumb_alt'];
    services = List.from(json['services']).map((e)=>Services.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_name'] = categoryName;
    _data['category_slug'] = categorySlug;
    _data['category_thumb'] = categoryThumb;
    _data['category_thumb_alt'] = categoryThumbAlt;
    _data['services'] = services.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Services {
  Services({
    required this.serviceName,
    required this.serviceSlug,
    required this.serviceThumb,
    required this.serviceThumbAlt,
  });
  late final String serviceName;
  late final String serviceSlug;
  late final String serviceThumb;
  late final String serviceThumbAlt;
  
  Services.fromJson(Map<String, dynamic> json){
    serviceName = json['service_name'];
    serviceSlug = json['service_slug'];
    serviceThumb = json['service_thumb'];
    serviceThumbAlt = json['service_thumb_alt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['service_name'] = serviceName;
    _data['service_slug'] = serviceSlug;
    _data['service_thumb'] = serviceThumb;
    _data['service_thumb_alt'] = serviceThumbAlt;
    return _data;
  }
}

abstract class CategoryServicesRepoInterface {
  Future<CategoryServices> categoryServices(String url);
}