// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'gifts.g.dart';

@JsonSerializable()
class Data {
  Data({
    this.data,
  });

  List<Gift>? data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Gift {
  Gift(
      {this.images,
      this.title,
      this.username,
      this.source_tld,
      this.id,
      this.liked});
  bool? liked = false;
  String? username;
  String? id;
  Images? images;
  String? title;
  String? source_tld;

  factory Gift.fromJson(Map<String, dynamic> json) => _$GiftFromJson(json);
}

@JsonSerializable()
class Images {
  Images({
    this.fixed_height_downsampled,
  });

  ImageFile? fixed_height_downsampled;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}

@JsonSerializable()
class ImageFile {
  ImageFile({
    this.size,
    this.url,
  });

  String? size;
  String? url;

  factory ImageFile.fromJson(Map<String, dynamic> json) =>
      _$ImageFileFromJson(json);
}

class SqlGift {
  SqlGift({required this.url, required this.giftId});
  String url;
  String giftId;

  SqlGift.fromMap(Map<String, dynamic> item)
      : url = item["url"],
        giftId = item["giftId"];

  Map<String, Object> toMap() {
    return {'url': url, 'giftId': giftId};
  }
}
