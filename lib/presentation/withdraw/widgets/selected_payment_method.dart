import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/new_payment_method_widget.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/withdraw_payment_method.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/withdraw_payment_method_bottomsheet.dart';

class SelectedPaymentMethod extends StatelessWidget {
  final PaymentMethodModel? paymentMethodModel;
  final PaymentMethodModel? selectedPaymentMethodModel;
  final List<PaymentMethodModel> paymentMethids;
  const SelectedPaymentMethod(
      {this.paymentMethodModel,
      required this.paymentMethids,
      this.selectedPaymentMethodModel,
      super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            elevation: 10,
            context: context,
            builder: (context) {
              return SelectPaymentMethodBottomsheet(
                paymentMethods: paymentMethids,
              );
            });
      },
      child: paymentMethodModel != null
          ? WithdrawPaymentMethod(
              paymentMethodModel!, selectedPaymentMethodModel)
          : const NewPaymentMethod(),
    );
  }
}
