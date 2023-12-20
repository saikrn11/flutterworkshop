import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterworkshop/constants/appfonts.dart';

import '../constants/appcolors.dart';


class MyTextField extends StatelessWidget {
  final String hint;
  final String lable;
  final String? initVal;
  final double? spacing;
  final IconData? prefix;
  final Widget? suffix;
  final TextStyle? fontStyle;
  final bool isEnabled;
  final bool isoutline;
  final bool isFilled;
  final bool isObscure;
  final bool isNumber;
  final bool decimal;
  final bool signed;
  final Color fillColor;
  final Color borderColor;
  final Color textColor;
  final TextEditingController? controller;
  final int? maxLength;
  final int? maxLines;
  final Function(String?)? onChange;
  final Function(String?)? onSaved;
  final Function(String)? submit;
  final String? Function(String?)? validator;
  final FocusNode? focus;
  final Function()? onTap;
  final Color iconColor;
  final TextInputAction formAction;
  const MyTextField({
    Key? key,
    required this.hint,
    required this.lable,
    this.prefix,
    this.suffix,
    this.spacing,
    this.fillColor = white,
    this.borderColor = black,
    this.textColor = black,
    this.isEnabled = true,
    this.isoutline = false,
    this.isFilled = true,
    this.isObscure = false,
    this.isNumber = false,
    this.decimal = false,
    this.signed = false,
    this.iconColor = black,
    this.controller,
    this.maxLength,
    this.maxLines = 1,
    this.initVal,
    this.onChange,
    this.onSaved,
    this.validator,
    this.onTap,
    this.focus,
    this.submit,
    this.formAction = TextInputAction.done,
    this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? () {} : onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 15,
            ),
            child: Text(
              lable,
              style: Fonts().h3m(context).copyWith(
                    fontWeight: FontWeight.w600,
                    color: borderColor,
                  ),
            ),
          ),
          const SizedBox(
            height: 05,
          ),
          TextFormField(
            style: isObscure
                ? Fonts().h2m(context).copyWith(
                      fontWeight: isObscure ? FontWeight.w900 : FontWeight.w600,
                      color: textColor,
                      letterSpacing: spacing ?? 1.0,
                    )
                : Fonts().h4l(context).copyWith(
                      fontWeight: isObscure ? FontWeight.w900 : FontWeight.w600,
                      color: textColor,
                      letterSpacing: spacing ?? 1.0,
                    ),
            focusNode: focus,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            controller: controller,
            maxLength: maxLength,
            maxLines: maxLines,
            buildCounter: (
              context, {
              required currentLength,
              required isFocused,
              maxLength,
            }) {
              return const SizedBox();
            },
            obscureText: isObscure,
            obscuringCharacter: '*',
            initialValue: initVal,
            onChanged: onChange,
            onSaved: onSaved,
            validator: validator,
            onFieldSubmitted: submit,
            textInputAction: formAction,
            keyboardType: isNumber
                ? TextInputType.numberWithOptions(
                    decimal: decimal,
                    signed: signed,
                  )
                : TextInputType.text,
            inputFormatters: isNumber
                ? [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                  ]
                : [],
            enableIMEPersonalizedLearning: true,
            enableSuggestions: true,
            enableInteractiveSelection: true,
            cursorColor: textColor,
            decoration: InputDecoration(
              border: isoutline
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: borderColor,
                        width: 1,
                      ),
                    )
                  : UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: isFilled ? Colors.transparent : borderColor,
                        width: 1,
                      ),
                    ),
              enabledBorder: isoutline
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: borderColor,
                        width: 1,
                      ),
                    )
                  : UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: isFilled ? Colors.transparent : borderColor,
                        width: 1,
                      ),
                    ),
              focusedBorder: isoutline
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: borderColor,
                        width: 1,
                      ),
                    )
                  : UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: isFilled ? Colors.transparent : borderColor,
                        width: 1,
                      ),
                    ),
              errorBorder: isoutline
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: red,
                        width: 1,
                      ),
                    )
                  : UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: borderColor,
                        width: 1,
                      ),
                    ),
              disabledBorder: isoutline
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: (onTap != null || onTap != () {}) && !isEnabled
                            ? borderColor
                            : ash,
                        width: 1,
                      ),
                    )
                  : UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: isFilled ? Colors.transparent : borderColor,
                        width: 1,
                      ),
                    ),
              filled: isFilled,
              fillColor: fillColor,
              enabled: isEnabled,
              hintText: hint,
              hintStyle: fontStyle ??
                  Fonts().h4m(context).copyWith(
                        color: grey,
                      ),
              errorStyle: Fonts().h4s(context).copyWith(
                    color: red,
                  ),
              isDense: true,
              icon: prefix == null
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Icon(
                        prefix,
                        size: 30,
                        color: iconColor,
                      ),
                    ),
              iconColor: textColor,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 10,
              ),
              suffix: suffix == null ? const SizedBox() : suffix!,
            ),
          ),
        ],
      ),
    );
  }
}
