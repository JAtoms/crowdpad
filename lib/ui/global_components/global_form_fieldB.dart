import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/colors.dart';
import '../../helpers/helpers.dart';
import '../../helpers/text_styles.dart';

class GlobalFormFieldB extends StatefulWidget {
  final String fieldName;
  final TextInputType keyBoardType;
  final TextEditingController textController;
  final int maxLength;
  final int? maxLines;
  final int textLength;

  final void Function(String)? onChanged;
  final bool isAutoFocus;
  final FocusNode? focusNode;

  const GlobalFormFieldB(
      {Key? key,
      required this.fieldName,
      required this.keyBoardType,
      required this.textController,
      this.focusNode,
      this.onChanged,
      this.maxLines,
      this.isAutoFocus = false,
      this.textLength = 100,
      this.maxLength = 35})
      : super(key: key);

  @override
  State<GlobalFormFieldB> createState() => _GlobalFormFieldBState();
}

class _GlobalFormFieldBState extends State<GlobalFormFieldB> {
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
          cursorColor: Colors.white,
          style:
              GlobalTextStyles.regularText(fontSize: 16, color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white24,
            hintText: widget.fieldName,
            hintStyle: GlobalTextStyles.regularText(color: Colors.white54),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white38),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white38)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.white70),
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
