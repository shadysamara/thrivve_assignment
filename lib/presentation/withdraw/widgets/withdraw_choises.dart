import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_controller.dart';

class WithdrawChoises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<WithdrawController>(builder: (controller) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.getChoises().map((e) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 5.sp),
                padding:
                    EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.grey[200]),
                child: Text(
                  '$e ${"sar".tr}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ));
          }).toList());
    });
  }
}
