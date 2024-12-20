import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class NewPaymentMethod extends StatelessWidget {
  const NewPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(10.sp),
      child: Row(
        children: [
          CircleAvatar(
            radius: 17.sp,
            backgroundColor: Colors.grey[100],
            child: const Icon(
              Icons.add_circle_outline,
              color: Colors.black87,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "payment_method".tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 11.sp),
              ),
              Text(
                "add_payment_method".tr,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 10.sp, color: Colors.grey[500]),
              )
            ],
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[500],
            size: 16.sp,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
