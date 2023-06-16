import 'package:eclipse_tz/app/data/entities/address/address_entity.dart';
import 'package:eclipse_tz/app/data/entities/company/company_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    required int id,
    required String name,
    required String username,
    required String email,
    required AddressEntity address,
    required String phone,
    required String website,
    required CompanyEntity company,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
