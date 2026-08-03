import 'package:flouka/features/address/presentation/providers/address_details_provider.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flouka/features/auth/presentation/providers/complete_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../features/auth/presentation/providers/otp_provider.dart';
import '../../features/auth/presentation/widgets/country_widget.dart';
import '../config/app_styles.dart';
import '../../features/language/presentation/provider/language_provider.dart';
import '../constants/constants.dart';
import '../models/text_field_model.dart';
import 'svg_widget.dart';
import 'text_field_widget.dart';

class ListTextFieldWidget extends StatefulWidget {
  const ListTextFieldWidget({
    super.key,
    required this.inputs,
    this.style,
    this.color,
    this.borderColor,
    this.isGradient,
    this.textColor,
    this.errorStyleColor,
    this.borderRadius = 20,
    this.borderWidth = .7,
  });
  final List<TextFieldModel> inputs;
  final TextStyle? style;
  final bool? isGradient;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor, errorStyleColor, textColor, color;

  @override
  State<ListTextFieldWidget> createState() => _ListTextFieldWidgetState();
}

class _ListTextFieldWidgetState extends State<ListTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> telInputs = ['phone', 'whats'];
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: List.generate(widget.inputs.length, (index) {
          TextFieldWidget textFieldWidget = TextFieldWidget(
            borderRadius: widget.borderRadius ?? 3.w,
            borderWidth: widget.borderWidth,
            titleWidget: Builder(
              builder: (ctx) {
                if (widget.inputs[index].titleWidgets != null) {
                  return Row(children: [...widget.inputs[index].titleWidgets!]);
                }
                if (widget.inputs[index].title != null) {
                  return widget.inputs[index].title!;
                }
                if (widget.inputs[index].editTextString != null) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.inputs[index].editTextString!,
                        style: TextStyleClass.normalStyle(color: Colors.black),
                      ),
                      SizedBox(width: 1.w),
                    ],
                  );
                }
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.inputs[index].image != null)
                      SvgWidget(
                        svg: widget.inputs[index].image!,
                        width: Constants.isTablet ? 5.w : null,
                        color: widget.textColor,
                      ),
                    if (widget.inputs[index].image != null) SizedBox(width: 2.w),
                    if (widget.inputs[index].label != null)
                      Text(
                        LanguageProvider.translate('inputs', widget.inputs[index].label!),
                        style:
                            widget.style ??
                            TextStyleClass.normalStyle(
                              color: widget.textColor ?? Colors.black,
                            ).copyWith(fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                  ],
                );
              },
            ),

            color: widget.color,
            borderColor: widget.borderColor,
            isLabel: widget.inputs[index].isLabel ?? false,
            // maxLength:inputs[index].ma
            controller: widget.inputs[index].controller,
            keyboardType: widget.inputs[index].textInputType,
            next: widget.inputs.length - 1 != index,
            hintText: widget.inputs[index].hint,
            onTextTap: widget.inputs[index].onTap,
            minLines: widget.inputs[index].min,
            maxLines: widget.inputs[index].max,
            maxLength: widget.inputs[index].length,

            validator: widget.inputs[index].validator,
            obscureText: widget.inputs[index].obscureText,
            suffix: telInputs.contains(widget.inputs[index].key) ?  CountryWidget(onChange: (code){
              if(code!=null){
                defaultCountry = code.dialCode??defaultCountry;
                Provider.of<OtpProvider>(context,listen: false).otpPhoneCode=code.dialCode;
                Provider.of<CompleteInfoProvider>(context,listen: false).otpPhoneCode=code.dialCode;
                Provider.of<AddressDetailsProvider>(context,listen: false).otpPhoneCode=code.dialCode;
                int length = CountryWidget.getLength;
                if (widget.inputs[index].controller.text.length > length) {
                  widget.inputs[index].controller.text = widget.inputs[index].controller.text.substring(0, length);
                  widget.inputs[index].controller.selection = TextSelection.collapsed(
                    offset: widget.inputs[index].controller.text.length,
                  );
                }
                widget.inputs[index].length = length;

                setState(() {

                });
              }
            },) : widget.inputs[index].suffix,
            prefix: widget.inputs[index].prefix,
            readOnly: widget.inputs[index].readOnly,
            width: widget.inputs[index].width,
            contentPadding: widget.inputs[index].contentPadding,
          );
          return textFieldWidget;
        }),
      ),
    );
  }
}
