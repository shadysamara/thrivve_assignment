import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thrivve_flutter_assignment/core/theme/theme_icon.dart';
import 'package:thrivve_flutter_assignment/core/translations/translation_icon.dart';
import 'package:thrivve_flutter_assignment/main.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_controller.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/selected_payment_method.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/withdraw_choises.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/withdraw_textfield.dart';

class WithdrawMainScreen extends StatelessWidget {
  const WithdrawMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: const [ThemeIcon(), TranslationIcon()]),
      body: GetBuilder<WithdrawController>(
        init: WithdrawController(getIt.get(), 400),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacer(20),
                _buildTitle(context),
                const VerticalSpacer(30),
                _buildWithdrawTextfield(controller),
                const VerticalSpacer(30),
                _buildBalanceNote(controller, context),
                const VerticalSpacer(30),
                WithdrawChoises(),
                const VerticalSpacer(30),
                _buildPaymentMethodTitle(context),
                const Divider(),
                _buildSelectedPaymentMethod(controller),
                const Divider(),
                const Spacer(),
                _buildWithdrawInfo(context),
                const Divider(),
                _buildContinueButton(controller, context),
                const VerticalSpacer(15),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      "withdraw_statement".tr,
      style: Get.theme.textTheme.headlineLarge,
    );
  }

  Widget _buildWithdrawTextfield(WithdrawController controller) {
    return WithdrawTextfield(
      balance: controller.balance,
      focusNode: controller.withdrawTextFieldFocusNode,
      textEditingController: controller.withdrawTextEditingController,
    );
  }

  Widget _buildBalanceNote(
      WithdrawController controller, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        '${"available_balance_note".tr} ${controller.balance} ${"sar".tr}',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  Widget _buildPaymentMethodTitle(BuildContext context) {
    return Text(
      "payment_method".tr,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }

  Widget _buildSelectedPaymentMethod(WithdrawController controller) {
    return Obx(() {
      return SelectedPaymentMethod(
        paymentMethodModel: controller.selectedPaymentMethod.value,
      );
    });
  }

  Widget _buildWithdrawInfo(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.info_outline, size: 18, color: Colors.grey[500]),
        const SizedBox(width: 5),
        Text(
          "withdraw_duration_note".tr,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: 11.sp, color: Colors.grey[500]),
        ),
      ],
    );
  }

  Widget _buildContinueButton(
      WithdrawController controller, BuildContext context) {
    return SizedBox(
      height: 35.sp,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(color: Colors.white),
          backgroundColor: const Color(0xFF16B5B7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
        ),
        onPressed: controller.selectedPaymentMethod == null
            ? null
            : () => controller.makeWithdraw(),
        child: Obx(() {
          return controller.isLoading.value
              ? Center(
                  child: SizedBox(
                    height: 22.sp,
                    width: 22.sp,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  ),
                )
              : Text(
                  "continue".tr,
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                );
        }),
      ),
    );
  }
}

class VerticalSpacer extends StatelessWidget {
  final double height;
  const VerticalSpacer(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
