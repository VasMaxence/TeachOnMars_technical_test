import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel extends HiveObject with _$ImageModel {

  @HiveType(typeId: 1)
  factory ImageModel({
    @HiveField(0) String? url,
    @HiveField(1) num? width,
    @HiveField(2) num? height,
  }) = _ImageModel;

  ImageModel._();
  
  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);
}
