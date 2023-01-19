import 'package:crowdpad/helpers/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/colors.dart';

class GlobalPasswordField extends StatefulWidget {
  final String fieldName;
  final TextEditingController textController;
  final int maxLength;
  final int textLength;
  bool isObscureText;
  final String topText;
  final bool isAutoFocus;

  GlobalPasswordField(
      {Key? key,
      this.topText = '',
      required this.fieldName,
      required this.textController,
      this.isObscureText = true,
      this.isAutoFocus = false,
      this.textLength = 100,
      this.maxLength = 35})
      : super(key: key);

  @override
  State<GlobalPasswordField> createState() => _GlobalPasswordFieldState();
}

class _GlobalPasswordFieldState extends State<GlobalPasswordField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.textController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: widget.isObscureText,
          obscuringCharacter: '*',
          autofocus: widget.isAutoFocus,
          inputFormatters: [
            LengthLimitingTextInputFormatter(widget.textLength)
          ],
          style: GlobalTextStyles.regularText(fontSize: 16),
          decoration: InputDecoration(
            suffixIcon: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () => setState(
                    () => widget.isObscureText = !widget.isObscureText),
                child: Icon(Icons.remove_red_eye_outlined,
                    color: widget.isObscureText
                        ? GlobalColors.primaryBlack.withAlpha(100)
                        : GlobalColors.primary)),
            hintText: widget.fieldName,
            hintStyle: GlobalTextStyles.regularText(
                color: Colors.black.withAlpha(130)),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: GlobalColors.textFieldStroke),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: GlobalColors.primaryBlack)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: GlobalColors.primaryBlack),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'This input is empty';
            }
            // else if (!isValidPassword(value)) {
            //   return 'Not a valid password';
            // }
            return null;
          },
        )
      ],
    );
  }
}
