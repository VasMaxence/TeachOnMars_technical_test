// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostModelAdapter extends TypeAdapter<_$_PostModel> {
  @override
  final int typeId = 0;

  @override
  _$_PostModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_PostModel(
      id: fields[0] as String?,
      type: fields[1] as int?,
      title: fields[2] as String?,
      author: fields[3] as String?,
      excerpt: fields[4] as String?,
      text: fields[5] as String?,
      picture: fields[6] as ImageModel?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_PostModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.excerpt)
      ..writeByte(5)
      ..write(obj.text)
      ..writeByte(6)
      ..write(obj.picture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      id: json['id'] as String?,
      type: json['type'] as int?,
      title: json['title'] as String?,
      author: json['author'] as String?,
      excerpt: json['excerpt'] as String?,
      text: json['text'] as String?,
      picture: json['picture'] == null
          ? null
          : ImageModel.fromJson(json['picture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'author': instance.author,
      'excerpt': instance.excerpt,
      'text': instance.text,
      'picture': instance.picture,
    };
