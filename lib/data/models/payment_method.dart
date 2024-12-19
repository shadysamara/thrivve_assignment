import 'package:json_annotation/json_annotation.dart';

part 'payment_method.g.dart'; // This is the file where code will be generated

@JsonSerializable()
class PaymentMethodModel {
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'beneficiary_iban')
  final String? beneficiaryIban;
  @JsonKey(name: 'bank_image')
  final String? bankImage;
  @JsonKey(name: 'bank_id')
  final int? bankId;
  @JsonKey(name: 'bank_name')
  final String? bankName;

  const PaymentMethodModel({
    required this.status,
    required this.beneficiaryIban,
    required this.bankImage,
    required this.bankId,
    required this.bankName,
  });

  // From JSON to PaymentMethodModel
  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodModelFromJson(json);

  // From PaymentMethodModel to JSON
  Map<String, dynamic> toJson() => _$PaymentMethodModelToJson(this);
}
