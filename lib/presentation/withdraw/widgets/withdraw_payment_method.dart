import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thrivve_flutter_assignment/core/presentation/widgets/custom_network_image.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_controller.dart';

class WithdrawPaymentMethod extends StatelessWidget {
  final PaymentMethodModel paymentMethodModel;
  final bool isChoisable;
  const WithdrawPaymentMethod(this.paymentMethodModel,
      [this.isChoisable = false]);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Get.find<WithdrawController>().selectPaymentMethod(paymentMethodModel);
      },
      child: Container(
        padding: EdgeInsets.all(10.sp),
        child: Row(
          children: [
            CircleAvatar(
              radius: 17.sp,
              backgroundColor: Colors.grey[100],
              child: NetworkImageWithLoader(
                paymentMethodModel.bankImage,
                radius: 100,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      (paymentMethodModel.bankName ?? ''),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 11.sp),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    paymentMethodModel.status == null
                        ? const SizedBox.shrink()
                        : Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 2.h),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(15.sp)),
                            child: Text(
                              paymentMethodModel.status!,
                              style: TextStyle(
                                  color: Colors.white,
                                  height: 1,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp),
                            ),
                          )
                  ],
                ),
                Text(
                  (paymentMethodModel.beneficiaryIban ?? ''),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 10.sp, color: Colors.grey[500]),
                )
              ],
            ),
            const Spacer(),
            isChoisable
                ? GetBuilder<WithdrawController>(builder: (controller) {
                    return Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2)),
                      child: Container(
                          margin: EdgeInsets.all(3.sp),
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.selectedPaymentMethod ==
                                      paymentMethodModel
                                  ? Colors.black
                                  : Colors.white)),
                    );
                  })
                : Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[500],
                    size: 16.sp,
                  ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
