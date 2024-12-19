import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:thrivve_flutter_assignment/core/utils/assets_manager.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_controller.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/selected_payment_method.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/withdraw_choises.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/withdraw_textfield.dart';

class WithdrawMainScreen extends StatelessWidget {
  const WithdrawMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<WithdrawController>(
          init: WithdrawController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "withdraw_statement".tr,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  WithdrawTextfield(
                    balance: controller.balance,
                    focusNode: controller.withdrawTextFieldFocusNode,
                    textEditingController:
                        controller.withdrawTextEditingController,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    '${"available_balance_note".tr} ${controller.balance} ${"sar".tr}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  WithdrawChoises(),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text("Payment_method".tr),
                  Divider(
                    color: Colors.grey[200],
                  ),
                  SelectedPaymentMethod()
                ],
              ),
            );
          }),
    );
  }
}
