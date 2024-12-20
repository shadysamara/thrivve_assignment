import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:thrivve_flutter_assignment/core/utils/assets_manager.dart';
import 'package:thrivve_flutter_assignment/data/models/withdraw_response.dart';

class SuccessWithdrawalScreen extends StatelessWidget {
  final WithdrawResponse withdrawResponse;
  const SuccessWithdrawalScreen(this.withdrawResponse);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                width: MediaQuery.of(context).size.width,
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
