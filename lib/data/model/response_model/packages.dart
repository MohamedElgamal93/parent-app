class Packages {
  Packages({
    required this.data,
  });
  late final List<Data> data;
  
  Packages.fromJson(Map<String, dynamic> json){
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
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.thumbAlt,
    required this.thumb,
    required this.startPrice,
    required this.days,
    required this.destination_Id,
    required this.destinationSlug,
  });
  late final int id;
  late final String name;
  late final String slug;
  late final String description;
  late final String thumbAlt;
  late final String thumb;
  late final int startPrice;
  late final int days;
  late final int destination_Id;
  late final String destinationSlug;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    thumbAlt = json['thumb_alt'];
    thumb = json['thumb'];
    startPrice = json['start_price'];
    days = json['days'];
    destination_Id = json['destination__id'];
    destinationSlug = json['destination_slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['description'] = description;
    _data['thumb_alt'] = thumbAlt;
    _data['thumb'] = thumb;
    _data['start_price'] = startPrice;
    _data['days'] = days;
    _data['destination__id'] = destination_Id;
    _data['destination_slug'] = destinationSlug;
    return _data;
  }
}
abstract class PackagesRepoInterface{
  Future<Packages> packages(String url);
}