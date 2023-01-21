import 'package:flutter/material.dart';
import 'package:tiktok_flutter/helpers/helpers.dart';

import '../../helpers/colors.dart';
import '../../helpers/text_styles.dart';

class GlobalFormField extends StatefulWidget {
  final String fieldName;
  final TextInputType keyBoardType;
  final TextEditingController textController;
  final int maxLength;
  final int? maxLines;
  final int textLength;
  final Color? fillColor;
  final void Function(String)? onChanged;
  final bool isAutoFocus;
  final FocusNode? focusNode;

  const GlobalFormField(
      {Key? key,
      required this.fieldName,
      required this.keyBoardType,
      required this.textController,
      this.focusNode,
      this.fillColor,
      this.onChanged,
      this.maxLines,
      this.isAutoFocus = false,
      this.textLength = 100,
      this.maxLength = 35})
      : super(key: key);

  @override
  State<GlobalFormField> createState() => _GlobalFormFieldState();
}

class _GlobalFormFieldState extends State<GlobalFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: widget.onChanged,
          focusNode: widget.focusNode,
          controller: widget.textController,
          keyboardType: widget.keyBoardType,
          maxLines: widget.maxLines,
          autofocus: widget.isAutoFocus,
          style: GlobalTextStyles.regularText(fontSize: 16),
          decoration: InputDecoration(
            hintText: widget.fieldName,
            hintStyle: GlobalTextStyles.regularText(
                color: Colors.black.withAlpha(130)),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.black.withAlpha(40)),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: GlobalColors.primary)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: GlobalColors.primary),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'This input is empty';
            } else if (widget.keyBoardType == TextInputType.emailAddress) {
              if (!isValidEmail(value)) {
                return 'Not a valid email';
              }
            } else if (widget.keyBoardType == TextInputType.name) {
              if (value.length < 3) {
                return 'Not a valid name';
              }
            }
            return null;
          },
        )
      ],
    );
  }
}
