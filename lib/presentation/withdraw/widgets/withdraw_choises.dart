import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/state_manager.dart';

import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_controller.dart';

class WithdrawChoises extends StatelessWidget {
  final List<int> choises;
  final Function function;
  final int selectedChoise;
  const WithdrawChoises(this.choises, this.function, this.selectedChoise);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: choises.map((e) {
          return GestureDetector(
            onTap: () {
              function(context, e);
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.sp),
                padding:
                    EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: selectedChoise == e
                        ? Colors.grey[700]
                        : Theme.of(context).dividerColor),
                child: Text(
                  '$e ${"sar".tr}',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: selectedChoise == e ? Colors.white : Colors.black),
                )),
          );
        }).toList());
  }
}
