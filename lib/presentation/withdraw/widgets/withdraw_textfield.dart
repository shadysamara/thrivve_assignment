import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';

import 'package:thrivve_flutter_assignment/core/presentation/widgets/shaking_widget.dart';
import 'package:thrivve_flutter_assignment/core/utils/assets_manager.dart';
import 'package:thrivve_flutter_assignment/presentation/withdraw/bloc/withdraw_controller.dart';

class WithdrawTextfield extends StatefulWidget {
  final double balance;
  final FocusNode focusNode;
  final TextEditingController textEditingController;

  const WithdrawTextfield({
    super.key,
    required this.balance,
    required this.focusNode,
    required this.textEditingController,
  });

  @override
  _WithdrawTextfieldState createState() => _WithdrawTextfieldState();
}

class _WithdrawTextfieldState extends State<WithdrawTextfield> {
  static const double minWithdrawAmount = 50.0;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  // Handling the logic when the focus changes
  void _onFocusChange() {
    if (!widget.focusNode.hasFocus) {
      _onTextFieldSubmitted(widget.textEditingController.text);
    }
  }

  // Function to handle the submission and validation of the text field input
  void _onTextFieldSubmitted(String value) {
    final newValue = double.tryParse(value) ?? 0.0;

    if (newValue < 0) {
      _showToast("Invalid input");
      return;
    }

    if (newValue < minWithdrawAmount) {
      _updateTextFieldValue(minWithdrawAmount);
      _showToast("min_withdraw_balance".tr);
    } else if (newValue > widget.balance) {
      _updateTextFieldValue(widget.balance);
      _showToast("max_balance_error".tr + widget.balance.toString());
    } else if (newValue % minWithdrawAmount != 0) {
      final adjustedValue =
          (newValue / minWithdrawAmount).ceil() * minWithdrawAmount;
      _updateTextFieldValue(adjustedValue);
      _showToast("fifteen_multiple_error".tr);
    } else {
      _updateTextFieldValue(newValue);
    }
  }

  // Update the text field value and move the cursor to the end
  void _updateTextFieldValue(double value) {
    widget.textEditingController.text = value.toString();
    widget.textEditingController.selection = TextSelection.collapsed(
        offset: widget.textEditingController.text.length);
  }

  // Show a toast message
  void _showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }

  // TextField style for reuse
  TextStyle get _textStyle => TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.bold,
        fontSize: 25.sp,
      );

  @override
  Widget build(BuildContext context) {
    return ShakeWidget(
      key: Get.find<WithdrawController>().shakeWidgetKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImgAssets.saudiFlag,
            height: 25.sp,
          ),
          const SizedBox(width: 10),
          Text("sar".tr),
          const SizedBox(width: 20),
          SizedBox(
            width: 100.sp,
            child: TextFormField(
              focusNode: widget.focusNode,
              controller: widget.textEditingController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  final doubleAmount = double.tryParse(value);
                  if (doubleAmount != null && doubleAmount > widget.balance) {
                    _updateTextFieldValue(widget.balance);
                    _showToast(
                        "max_balance_error".tr + widget.balance.toString());
                  }
                }
              },
              onFieldSubmitted: _onTextFieldSubmitted,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              style: _textStyle,
              decoration: InputDecoration(
                hintStyle: _textStyle.copyWith(color: Colors.grey[400]),
                hintText: '000.00',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
