import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/state_manager.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_controller.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/new_payment_method_widget.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/withdraw_payment_method.dart';

class SelectPaymentMethodBottomsheet extends StatelessWidget {
  final List<PaymentMethodModel> paymentMethods;
  final PaymentMethodModel? selectedPaymentMethod;
  const SelectPaymentMethodBottomsheet(
      {super.key, required this.paymentMethods, this.selectedPaymentMethod});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "choose_payment_title".tr,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 15.sp),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Column(children: [
                ...paymentMethods.map((e) {
                  return WithdrawPaymentMethod(e, selectedPaymentMethod, true);
                }),
                const NewPaymentMethod()
              ]),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
        Positioned(
          top: 13,
          right: 15,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.1),
              child: Icon(Icons.close),
            ),
          ),
        )
      ],
    );
  }
}
