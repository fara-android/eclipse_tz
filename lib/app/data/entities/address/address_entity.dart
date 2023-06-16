import 'package:eclipse_tz/app/data/entities/geo/geo_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_entity.freezed.dart';
part 'address_entity.g.dart';

@freezed
class AddressEntity with _$AddressEntity {
  factory AddressEntity({
    required String street,
    required String suite,
    required String city,
    required String zipcode,
    required GeoEntity geo,
  }) = _AddressEntity;

  factory AddressEntity.fromJson(Map<String, dynamic> json) =>
      _$AddressEntityFromJson(json);
}
