import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:thrivve_flutter_assignment/core/utils/assets_manager.dart';

class WithdrawTextfield extends StatefulWidget {
  final double balance;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  const WithdrawTextfield(
      {super.key,
      required this.balance,
      required this.focusNode,
      required this.textEditingController});

  @override
  State<WithdrawTextfield> createState() => _WithdrawTextfieldState();
}

class _WithdrawTextfieldState extends State<WithdrawTextfield> {
  @override
  void initState() {
    super.initState();
    // Add a listener to the FocusNode to detect when the TextField loses focus
    widget.focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!widget.focusNode.hasFocus) {
      onTextFieldSubmitted(widget.textEditingController.text);
    }
  }

  onTextFieldSubmitted(String v) {
    double newValue = double.parse(v);

    if (newValue >= 0 && newValue <= widget.balance) {
      if (newValue < 50) {
        widget.textEditingController.text = "50";
        Fluttertoast.showToast(msg: "min_withdraw_balance".tr);
      } else if (newValue > widget.balance) {
        widget.textEditingController.text = widget.balance.toString();
        Fluttertoast.showToast(
            msg: "max_balance_error".tr + widget.balance.toString());
      } else if (newValue % 50 == 0) {
        widget.textEditingController.text = newValue.toString();
      } else {
        double difference = 50 - (newValue % 50);
        newValue += difference;
        widget.textEditingController.text = newValue.toString();
        Fluttertoast.showToast(msg: "fifteen_multiple_error".tr);
      }
    }
    widget.textEditingController.selection = TextSelection.collapsed(
        offset: widget.textEditingController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImgAssets.saudiFlag,
          height: 25.sp,
        ),
        const SizedBox(
          width: 10,
        ),
        Text("sar".tr),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 100.sp,
          child: TextFormField(
            focusNode: widget.focusNode,
            controller: widget.textEditingController,
            onChanged: (v) {
              if (v.isNotEmpty) {
                if (double.parse(v) > widget.balance) {
                  Fluttertoast.showToast(
                      msg: "max_balance_error".tr + widget.balance.toString());
                  widget.textEditingController.text = widget.balance.toString();
                }
              }
            },
            onFieldSubmitted: onTextFieldSubmitted,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 25.sp),
            decoration: InputDecoration(
                hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp),
                hintText: '000.00',
                border: InputBorder.none),
          ),
        )
      ],
    );
  }
}
