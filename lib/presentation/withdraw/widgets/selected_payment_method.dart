import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_controller.dart';

class SelectedPaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<WithdrawController>(
        id: "selected_payment_method",
        builder: (controller) {
          if (controller.selectedPaymentMethod == null) {
            return Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.sp,
                    child: const Icon(Icons.add_circle_outline),
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
