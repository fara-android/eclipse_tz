import 'package:eclipse_tz/app/data/entities/geo/geo_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_entity.freezed.dart';
part 'company_entity.g.dart';

@freezed
class CompanyEntity with _$CompanyEntity {
  factory CompanyEntity({
    required String name,
    required String catchPhrase,
    required String bs,
  }) = _CompanyEntity;

  factory CompanyEntity.fromJson(Map<String, dynamic> json) =>
      _$CompanyEntityFromJson(json);
}
