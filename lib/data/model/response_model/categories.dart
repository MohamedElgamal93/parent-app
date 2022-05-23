class Categoriess {
  Categoriess({
    required this.data,
  });
  late final List<Data> data;
  
  Categoriess.fromJson(Map<String, dynamic> json){
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
    required this.categories,
    required this.relatedPages,
    required this.packagesHotOffers,
    required this.excursionsHotOffers,
    required this.cruisesHotOffers,
  });
  late final List<Categories> categories;
  late final List<RelatedPages> relatedPages;
  late final List<PackagesHotOffers> packagesHotOffers;
  late final List<ExcursionsHotOffers> excursionsHotOffers;
  late final List<CruisesHotOffers> cruisesHotOffers;
  
  Data.fromJson(Map<String, dynamic> json){
    categories = List.from(json['categories']).map((e)=>Categories.fromJson(e)).toList();
    relatedPages = List.from(json['related_pages']).map((e)=>RelatedPages.fromJson(e)).toList();
    packagesHotOffers = List.from(json['packages_hot_offers']).map((e)=>PackagesHotOffers.fromJson(e)).toList();
    excursionsHotOffers = List.from(json['excursions_hot_offers']).map((e)=>ExcursionsHotOffers.fromJson(e)).toList();
    cruisesHotOffers = List.from(json['cruises_hot_offers']).map((e)=>CruisesHotOffers.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categories'] = categories.map((e)=>e.toJson()).toList();
    _data['related_pages'] = relatedPages.map((e)=>e.toJson()).toList();
    _data['packages_hot_offers'] = packagesHotOffers.map((e)=>e.toJson()).toList();
    _data['excursions_hot_offers'] = excursionsHotOffers.map((e)=>e.toJson()).toList();
    _data['cruises_hot_offers'] = cruisesHotOffers.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Categories {
  Categories({
    required this.id,
    required this.name,
    required this.slug,
    required this.thumbAlt,
    required this.thumb,
    required this.destinationSlug,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String thumbAlt;
  late final String thumb;
  late final String destinationSlug;
  
  Categories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    thumbAlt = json['thumb_alt'];
    thumb = json['thumb'];
    destinationSlug = json['destination_slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['thumb_alt'] = thumbAlt;
    _data['thumb'] = thumb;
    _data['destination_slug'] = destinationSlug;
    return _data;
  }
}

class RelatedPages {
  RelatedPages({
    required this.id,
    required this.name,
    required this.slug,
    required this.thumbAlt,
    required this.thumb,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String thumbAlt;
  late final String? thumb;
  
  RelatedPages.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    thumbAlt = json['thumb_alt'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['thumb_alt'] = thumbAlt;
    _data['thumb'] = thumb;
    return _data;
  }
}

class PackagesHotOffers {
  PackagesHotOffers({
    required this.id,
    required this.name,
    required this.slug,
    required this.thumbAlt,
    required this.thumb,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String thumbAlt;
  late final String thumb;
  
  PackagesHotOffers.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    thumbAlt = json['thumb_alt'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['thumb_alt'] = thumbAlt;
    _data['thumb'] = thumb;
    return _data;
  }
}

class ExcursionsHotOffers {
  ExcursionsHotOffers({
    required this.id,
    required this.name,
    required this.slug,
    required this.thumbAlt,
    required this.thumb,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String thumbAlt;
  late final String thumb;
  
  ExcursionsHotOffers.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    thumbAlt = json['thumb_alt'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['thumb_alt'] = thumbAlt;
    _data['thumb'] = thumb;
    return _data;
  }
}

class CruisesHotOffers {
  CruisesHotOffers({
    required this.id,
    required this.name,
    required this.slug,
    required this.thumbAlt,
    required this.thumb,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String thumbAlt;
  late final String thumb;
  
  CruisesHotOffers.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    thumbAlt = json['thumb_alt'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['thumb_alt'] = thumbAlt;
    _data['thumb'] = thumb;
    return _data;
  }
}
abstract class CategoriesRepoInterface{
  Future<Categoriess> categories(String url);
}