import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thrivve_flutter_assignment/core/routes/routes_names.dart';
import 'package:thrivve_flutter_assignment/core/utils/assets_manager.dart';
import 'package:thrivve_flutter_assignment/data/models/withdraw_response.dart';

class SuccessWithdrawalScreen extends StatelessWidget {
  final WithdrawResponse withdrawResponse;
  const SuccessWithdrawalScreen(this.withdrawResponse, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(color: Colors.white),
              backgroundColor: const Color(0xFF16B5B7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.sp),
              ),
            ),
            onPressed: () {
              Get.offNamed(Routenames.withdrawMainPage);
            },
            child: Text(
              "withdraw_again".tr,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            )),
      ),
      body: Center(
        child: Stack(
          children: [
            Stack(
              children: [
                LottieBuilder.asset(
                  JsonAssets.congratJson,
                  height: 400.sp,
                ),
                Positioned.fill(
                  child: Center(
                    child: LottieBuilder.asset(
                      JsonAssets.doneJson,
                      height: 200.sp,
                      repeat: false,
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              bottom: 60,
              child: Container(
                width: Get.width,
                margin: EdgeInsets.all(20.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      withdrawResponse.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontSize: 15.sp),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      withdrawResponse.message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 10.sp, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
