import 'package:json_annotation/json_annotation.dart';

/// This allows the `SongInfo` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star symbol denotes the source file name.
part 'song_info.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class SongInfo {
  String title;
  String filePath;
  bool isOnline;

  SongInfo(
      {required this.title, required this.filePath, this.isOnline = false});

  /// A necessary factory constructor for creating a new SongInfo instance
  /// from a map. Pass the map to the generated `_$SongInfoFromJson()` constructor.
  /// The constructor is named after the source class, in this case, SongInfo.
  factory SongInfo.fromJson(Map<String, dynamic> json) =>
      _$SongInfoFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$SongInfoToJson`.
  Map<String, dynamic> toJson() => _$SongInfoToJson(this);
}
