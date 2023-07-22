import 'package:json_annotation/json_annotation.dart';

part 'movie_country_rm.g.dart';

@JsonSerializable(createToJson: false)
class CountryRM {
  CountryRM({
    required this.name,
  });

  final String name;

  static const fromJson = _$CountryRMFromJson;
}
