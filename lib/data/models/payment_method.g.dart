// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodModel _$PaymentMethodModelFromJson(Map<String, dynamic> json) =>
    PaymentMethodModel(
      status: json['status'] as String?,
      beneficiaryIban: json['beneficiary_iban'] as String?,
      bankImage: json['bank_image'] as String?,
      bankId: (json['bank_id'] as num?)?.toInt(),
      bankName: json['bank_name'] as String?,
    );

Map<String, dynamic> _$PaymentMethodModelToJson(PaymentMethodModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'beneficiary_iban': instance.beneficiaryIban,
      'bank_image': instance.bankImage,
      'bank_id': instance.bankId,
      'bank_name': instance.bankName,
    };
