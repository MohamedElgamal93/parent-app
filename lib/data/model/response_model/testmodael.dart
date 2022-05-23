import 'package:state_notifier/state_notifier.dart';

import 'package:riverpod/riverpod.dart';

class Photo {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Photo.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}

///زيادة
class PhotoList extends StateNotifier  <List<Photo>> {
  PhotoList(List<Photo>state):super(state);
  void addAll(List<Photo> photos)
  {

    state.addAll(photos);
  }
    void remove(List<Photo> photos)
  {

     state.remove(photos);
  }

}

