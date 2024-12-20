import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:thrivve_flutter_assignment/core/presentation/widgets/shaking_widget.dart';
import 'package:thrivve_flutter_assignment/core/theme/theme_cubit.dart';
import 'package:thrivve_flutter_assignment/core/translations/localization_cubit.dart';
import 'package:thrivve_flutter_assignment/core/utils/assets_manager.dart';
import 'package:thrivve_flutter_assignment/data/models/payment_method.dart';
import 'package:thrivve_flutter_assignment/main.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_bloc.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_events.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_states.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/screens/success_withdraw.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/selected_payment_method.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/withdraw_choises.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/widgets/withdraw_textfield.dart';
import 'package:thrivve_flutter_assignment/injection_container.dart' as di;

class WithdrawMainScreen extends StatelessWidget {
  WithdrawMainScreen({super.key});
  selectChoise(BuildContext context, int value) {
    context.read<WithdrawBloc>().add(SelectBalanceChoise(value));
  }

  final GlobalKey<ShakeWidgetState> shakeWidgetKey =
      GlobalKey<ShakeWidgetState>();
  @override
  Widget build(BuildContext context) {
    context.read<WithdrawBloc>().add(LoadWithdrawPageEvent(400));
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, themeMode) {
            return GestureDetector(
              onTap: () {
                if (context.read<ThemeCubit>().isLightMode(context)) {
                  context.read<ThemeCubit>().changeMode(ThemeMode.dark);
                } else {
                  context.read<ThemeCubit>().changeMode(ThemeMode.light);
                }
              },
              child: themeMode == ThemeMode.light
                  ? LottieBuilder.asset(JsonAssets.moonJson)
                  : LottieBuilder.asset(JsonAssets.sunJson),
            );
          }),
          BlocBuilder<LocalizationCubit, Locale>(builder: (context, locale) {
            return GestureDetector(
              onTap: () {
                context.read<LocalizationCubit>().changeLanguage();
              },
              child: LottieBuilder.asset(
                JsonAssets.languageJson,
              ),
            );
          })
        ],
      ),
      body: BlocBuilder<WithdrawBloc, WithdrawState>(builder: (context, state) {
        if (state is WithdrawInitialState) {
          return Container();
        }
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                "withdraw_statement".tr,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              WithdrawTextfield(
                shakeWidgetKey: shakeWidgetKey,
                balance: state.balance.toDouble(),
                focusNode: state.focusNode,
                textEditingController: state.textEditingController,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  '${"available_balance_note".tr} ${state.balance} ${"sar".tr}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              WithdrawChoises(
                  state.choises, selectChoise, state.selectedChoise),
              const SizedBox(
                height: 30,
              ),
              Text(
                "payment_method".tr,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Divider(),
              SelectedPaymentMethod(
                paymentMethodModel: state.selectedPaymentMethod,
                paymentMethids: state.paymentMethods,
              ),
              const Divider(),
              const Spacer(),
              Row(
                children: [
                  Icon(Icons.info_outline, size: 18, color: Colors.grey[500]),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "withdraw_duration_note".tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 11.sp, color: Colors.grey[500]),
                  )
                ],
              ),
              const Divider(),
              SizedBox(
                  height: 35.sp,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.white),
                        backgroundColor: const Color(0xFF16B5B7),
                        // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              16.sp), // Set the radius here
                        ),
                      ),
                      onPressed: (state.selectedPaymentMethod == null)
                          ? null
                          : () {
                              context
                                  .read<WithdrawBloc>()
                                  .add(MakeWithdrawEvent(shakeWidgetKey));
                            },
                      child: (state is WithdrawLoadingState)
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
                            ))),
              SizedBox(
                height: 15.sp,
              )
            ],
          ),
        );
      }),
    );
  }
}
