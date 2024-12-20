import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_controller.dart';

class WithdrawChoises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<WithdrawController>(builder: (controller) {
      return Obx(() {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.choices.map((e) {
              return GestureDetector(
                onTap: () {
                  controller.setWithdrawbasedOnChoise(e);
                },
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.sp),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: controller.selectedChoiseValue.value == e
                            ? Colors.grey[700]
                            : Theme.of(context).dividerColor),
                    child: Text(
                      '$e ${"sar".tr}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: controller.selectedChoiseValue.value == e
                              ? Colors.white
                              : Colors.black),
                    )),
              );
            }).toList());
      });
    });
  }
}
