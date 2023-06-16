// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'album_with_photos_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AlbumWithPhotosEntity _$AlbumWithPhotosEntityFromJson(
    Map<String, dynamic> json) {
  return _AlbumWithPhotosEntity.fromJson(json);
}

/// @nodoc
mixin _$AlbumWithPhotosEntity {
  int get userId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<PhotoEntity> get photos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlbumWithPhotosEntityCopyWith<AlbumWithPhotosEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlbumWithPhotosEntityCopyWith<$Res> {
  factory $AlbumWithPhotosEntityCopyWith(AlbumWithPhotosEntity value,
          $Res Function(AlbumWithPhotosEntity) then) =
      _$AlbumWithPhotosEntityCopyWithImpl<$Res, AlbumWithPhotosEntity>;
  @useResult
  $Res call({int userId, int id, String title, List<PhotoEntity> photos});
}

/// @nodoc
class _$AlbumWithPhotosEntityCopyWithImpl<$Res,
        $Val extends AlbumWithPhotosEntity>
    implements $AlbumWithPhotosEntityCopyWith<$Res> {
  _$AlbumWithPhotosEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AlbumWithPhotosEntityCopyWith<$Res>
    implements $AlbumWithPhotosEntityCopyWith<$Res> {
  factory _$$_AlbumWithPhotosEntityCopyWith(_$_AlbumWithPhotosEntity value,
          $Res Function(_$_AlbumWithPhotosEntity) then) =
      __$$_AlbumWithPhotosEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int id, String title, List<PhotoEntity> photos});
}

/// @nodoc
class __$$_AlbumWithPhotosEntityCopyWithImpl<$Res>
    extends _$AlbumWithPhotosEntityCopyWithImpl<$Res, _$_AlbumWithPhotosEntity>
    implements _$$_AlbumWithPhotosEntityCopyWith<$Res> {
  __$$_AlbumWithPhotosEntityCopyWithImpl(_$_AlbumWithPhotosEntity _value,
      $Res Function(_$_AlbumWithPhotosEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
    Object? photos = null,
  }) {
    return _then(_$_AlbumWithPhotosEntity(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotoEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AlbumWithPhotosEntity implements _AlbumWithPhotosEntity {
  _$_AlbumWithPhotosEntity(
      {required this.userId,
      required this.id,
      required this.title,
      required final List<PhotoEntity> photos})
      : _photos = photos;

  factory _$_AlbumWithPhotosEntity.fromJson(Map<String, dynamic> json) =>
      _$$_AlbumWithPhotosEntityFromJson(json);

  @override
  final int userId;
  @override
  final int id;
  @override
  final String title;
  final List<PhotoEntity> _photos;
  @override
  List<PhotoEntity> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'AlbumWithPhotosEntity(userId: $userId, id: $id, title: $title, photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AlbumWithPhotosEntity &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, id, title,
      const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AlbumWithPhotosEntityCopyWith<_$_AlbumWithPhotosEntity> get copyWith =>
      __$$_AlbumWithPhotosEntityCopyWithImpl<_$_AlbumWithPhotosEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AlbumWithPhotosEntityToJson(
      this,
    );
  }
}

abstract class _AlbumWithPhotosEntity implements AlbumWithPhotosEntity {
  factory _AlbumWithPhotosEntity(
      {required final int userId,
      required final int id,
      required final String title,
      required final List<PhotoEntity> photos}) = _$_AlbumWithPhotosEntity;

  factory _AlbumWithPhotosEntity.fromJson(Map<String, dynamic> json) =
      _$_AlbumWithPhotosEntity.fromJson;

  @override
  int get userId;
  @override
  int get id;
  @override
  String get title;
  @override
  List<PhotoEntity> get photos;
  @override
  @JsonKey(ignore: true)
  _$$_AlbumWithPhotosEntityCopyWith<_$_AlbumWithPhotosEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
