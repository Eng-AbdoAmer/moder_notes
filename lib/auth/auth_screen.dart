import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_notes/auth/auth_controller.dart';
import 'package:modern_notes/auth/widgets/custom_text_form_field.dart';

import '../components/valid.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: authController.formState,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Obx(
                  () => Image.asset(authController.isLogin.value
                      ? "assets/login.gif"
                      : "assets/signup.gif"),
                ),
                Obx(
                  () => Visibility(
                    visible: !authController.isLogin.value,
                    child: CustomTextFormField(
                      hint: "username",
                      keyboardType: TextInputType.name,
                      onSave: (v) {
                        authController.userName = v;
                      },
                      valid: (val) {
                        return validInput(val!, 3, 50);
                      },
                    ),
                  ),
                ),
                CustomTextFormField(
                  hint: "email",
                  keyboardType: TextInputType.emailAddress,
                  onSave: (v) {
                    authController.email = v;
                  },
                  valid: (val) {
                    return validInput(val!, 3, 255);
                  },
                ),
                CustomTextFormField(
                  hint: "password",
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  mLines: 1,
                  onSave: (v) {
                    authController.password = v;
                  },
                  valid: (val) {
                    return validInput(val!, 3, 255);
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50)),
                  onPressed: () {
                    authController.submit();
                  },
                  child: Obx(() =>
                      Text(authController.isLogin.value ? "Login" : "SignUp")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        authController.isLogin.value
                            ? "Don't have account "
                            : "Have account",
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        authController.changeScreen();
                      },
                      child: Obx(
                        () => Text(
                          authController.isLogin.value ? "SignUp" : "Login",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
