class SlidersResponse {
  SlidersResponse({
    required this.data,
  });
  late final List<Data> data;
  
  SlidersResponse.fromJson(Map<String, dynamic> json){
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
    required this.title,
    required this.alt,
    required this.smallText,
    required this.image,
  });
  late final int id;
  late final String title;
  late final String alt;
  late final String smallText;
  late final String image;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    alt = json['alt'];
    smallText = json['small_text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['alt'] = alt;
    _data['small_text'] = smallText;
    _data['image'] = image;
    return _data;
  }
}
abstract class SlidersRepoInterface{
  Future<SlidersResponse> sliders(String url);
  
}