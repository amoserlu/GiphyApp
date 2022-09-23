// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gifts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Gift.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'data': instance.data,
    };

Gift _$GiftFromJson(Map<String, dynamic> json) => Gift(
      images: json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      title: json['title'] as String?,
      username: json['username'] as String?,
      source_tld: json['source_tld'] as String?,
      id: json['id'] as String?,
      liked: json['liked'] as bool?,
    );

Map<String, dynamic> _$GiftToJson(Gift instance) => <String, dynamic>{
      'liked': instance.liked,
      'username': instance.username,
      'id': instance.id,
      'images': instance.images,
      'title': instance.title,
      'source_tld': instance.source_tld,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      fixed_height_downsampled: json['fixed_height_downsampled'] == null
          ? null
          : ImageFile.fromJson(
              json['fixed_height_downsampled'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'fixed_height_downsampled': instance.fixed_height_downsampled,
    };

ImageFile _$ImageFileFromJson(Map<String, dynamic> json) => ImageFile(
      size: json['size'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ImageFileToJson(ImageFile instance) => <String, dynamic>{
      'size': instance.size,
      'url': instance.url,
    };
