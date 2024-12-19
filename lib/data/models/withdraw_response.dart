import 'package:json_annotation/json_annotation.dart';

part 'withdraw_response.g.dart'; // This is the generated file

@JsonSerializable()
class WithdrawResponse {
  final String title;
  final String message;

  WithdrawResponse({
    required this.title,
    required this.message,
  });

  // From JSON to WithdrawResponse
  factory WithdrawResponse.fromJson(Map<String, dynamic> json) =>
      _$WithdrawResponseFromJson(json);

  // From WithdrawResponse to JSON
  Map<String, dynamic> toJson() => _$WithdrawResponseToJson(this);
}
