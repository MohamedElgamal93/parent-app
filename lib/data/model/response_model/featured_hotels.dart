class FeaturedHotels {
  FeaturedHotels({
    required this.generalData,
    required this.data,
  });
  late final GeneralData generalData;
  late final List<Data> data;
  
  FeaturedHotels.fromJson(Map<String, dynamic> json){
    generalData = GeneralData.fromJson(json['general_data']);
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['general_data'] = generalData.toJson();
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class GeneralData {
  GeneralData({
    required this.categoryId,
    required this.categoryName,
    required this.categorySlug,
    required this.serviceId,
    required this.serviceName,
    required this.serviceSlug,
    required this.countryId,
    required this.countryName,
    required this.countrySlug,
    required this.cityId,
    required this.cityName,
    required this.citySlug,
  });
  late final int categoryId;
  late final String categoryName;
  late final String categorySlug;
  late final int serviceId;
  late final String serviceName;
  late final String serviceSlug;
  late final int countryId;
  late final String countryName;
  late final String countrySlug;
  late final int cityId;
  late final String cityName;
  late final String citySlug;
  
  GeneralData.fromJson(Map<String, dynamic> json){
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categorySlug = json['category_slug'];
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    serviceSlug = json['service_slug'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    countrySlug = json['country_slug'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    citySlug = json['city_slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_id'] = categoryId;
    _data['category_name'] = categoryName;
    _data['category_slug'] = categorySlug;
    _data['service_id'] = serviceId;
    _data['service_name'] = serviceName;
    _data['service_slug'] = serviceSlug;
    _data['country_id'] = countryId;
    _data['country_name'] = countryName;
    _data['country_slug'] = countrySlug;
    _data['city_id'] = cityId;
    _data['city_name'] = cityName;
    _data['city_slug'] = citySlug;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.slug,
    required this.thumb,
    required this.thumbAlt,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String thumb;
  late final String thumbAlt;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    thumb = json['thumb'];
    thumbAlt = json['thumb_alt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['thumb'] = thumb;
    _data['thumb_alt'] = thumbAlt;
    return _data;
  }
}

abstract class FeaturedHotelsRepoInterface{
  Future<FeaturedHotels> featuredHotels(String url);
  
}