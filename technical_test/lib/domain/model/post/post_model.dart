import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:technical_test/domain/model/image/image_model.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel extends HiveObject with _$PostModel {
  @HiveType(typeId: 0)
  factory PostModel({
    @HiveField(0) String? id,
    @HiveField(1) int? type,
    @HiveField(2) String? title,
    @HiveField(3) String? author,
    @HiveField(4) String? excerpt,
    @HiveField(5) String? text,
    @HiveField(6) ImageModel? picture,
  }) = _PostModel;

  PostModel._();
  
  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}
