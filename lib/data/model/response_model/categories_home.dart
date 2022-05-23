class CategoriesHome {
  CategoriesHome({
    required this.countryData,
    required this.data,
  });
  late final CountryData countryData;
  late final List<Data> data;
  
  CategoriesHome.fromJson(Map<String, dynamic> json){
    countryData = CountryData.fromJson(json['country_data']);
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['country_data'] = countryData.toJson();
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class CountryData {
  CountryData({
    required this.id,
    required this.slug,
    required this.name,
  });
  late final String id;
  late final String slug;
  late final String name;
  
  CountryData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['slug'] = slug;
    _data['name'] = name;
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

abstract class CategoriesHomeRepoInterface {
  Future<CategoriesHome> blogs(String url);
}
