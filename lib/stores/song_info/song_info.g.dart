// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongInfo _$SongInfoFromJson(Map<String, dynamic> json) {
  return SongInfo(
    title: json['title'] as String,
    filePath: json['filePath'] as String,
    isOnline: json['isOnline'] as bool,
  );
}

Map<String, dynamic> _$SongInfoToJson(SongInfo instance) => <String, dynamic>{
      'title': instance.title,
      'filePath': instance.filePath,
      'isOnline': instance.isOnline,
    };
