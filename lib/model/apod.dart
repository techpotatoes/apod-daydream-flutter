import 'package:json_annotation/json_annotation.dart';

part 'apod.g.dart';

@JsonSerializable(explicitToJson: true)
class Apod {
  String title;
  DateTime date;
  String explanation;
  String hdurl;
  String url;
  String media_type;
  String service_version;
  String copyright;

  Apod(this.title, this.date, this.explanation, this.hdurl, this.url, this.media_type, this.service_version, this.copyright);

  factory Apod.fromJson(Map<String, dynamic> json) => _$ApodFromJson(json);

  Map<String, dynamic> toJson() => _$ApodToJson(this);
}