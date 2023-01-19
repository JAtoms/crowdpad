import 'package:crowdpad/dependency/navigation/navigator_routes.dart';
import 'package:crowdpad/helpers/global_assets.dart';
import 'package:crowdpad/helpers/global_strings.dart';
import 'package:crowdpad/helpers/helpers.dart';
import 'package:crowdpad/helpers/measures.dart';
import 'package:crowdpad/helpers/size_config.dart';
import 'package:crowdpad/ui/global_components/global_button.dart';
import 'package:crowdpad/ui/global_components/global_form_field.dart';
import 'package:crowdpad/ui/global_components/global_password_field.dart';
import 'package:flutter/material.dart';

import '../../dependency/navigation/global_routes.dart';
import '../../helpers/colors.dart';
import '../../helpers/text_styles.dart';
import '../global_components/global_back_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(GlobalAssets.bottomDecoration,
                      height: 60, fit: BoxFit.contain)),
              SingleChildScrollView(
                child: Padding(
                  padding: globalMargin(margin: Margin.horizontal),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const GlobalBackButton(),
                        SizedBox(height: 5.heightAdjusted),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(signIn,
                                style: GlobalTextStyles.semiBold(
                                    fontSize: 26,
                                    color: GlobalColors.primaryBlack))),
                        SizedBox(height: 12.heightAdjusted),
                        GlobalFormField(
                            fieldName: 'Email address',
                            keyBoardType: TextInputType.emailAddress,
                            textController: emailController),
                        SizedBox(height: 5.heightAdjusted),
                        GlobalPasswordField(
                            fieldName: 'Password',
                            textController: passwordController),
                        SizedBox(height: 12.heightAdjusted),
                        GlobalButton(
                            btnText: signIn,
                            onTap: () {
                              if (formKey.validate) {
                                // getItInstance<AuthCubit>().login(
                                //     email: emailController.text,
                                //     password: passwordController.text,
                                //     context: context);
                              }
                            }),
                        SizedBox(height: SizeConfig.heightAdjusted(20)),
                        GestureDetector(
                          onTap: () =>
                              globalReplaceWith(route: Routes.signUpScreen),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(dontHaveAccount,
                                  style: GlobalTextStyles.regularText(
                                      color: Colors.black.withAlpha(170),
                                      fontSize: 16)),
                              Text(signUp,
                                  style: GlobalTextStyles.medium(
                                      color: GlobalColors.primary,
                                      fontSize: 16)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
