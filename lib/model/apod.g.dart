// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Apod _$ApodFromJson(Map<String, dynamic> json) {
  return Apod(
    json['title'] as String,
    json['date'] == null ? null : DateTime.parse(json['date'] as String),
    json['explanation'] as String,
    json['hdurl'] as String,
    json['url'] as String,
    json['media_type'] as String,
    json['service_version'] as String,
    json['copyright'] as String,
  );
}

Map<String, dynamic> _$ApodToJson(Apod instance) => <String, dynamic>{
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'explanation': instance.explanation,
      'hdurl': instance.hdurl,
      'url': instance.url,
      'media_type': instance.media_type,
      'service_version': instance.service_version,
      'copyright': instance.copyright,
    };
