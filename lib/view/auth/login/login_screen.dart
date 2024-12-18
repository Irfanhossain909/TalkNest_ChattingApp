import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talknest/controllers/auth_controller.dart';
import 'package:talknest/utils/Color.dart';
import 'package:talknest/view/auth/register/register_screen.dart';
import 'package:talknest/widgets/custom_button.dart';
import 'package:talknest/widgets/text_feiled.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/bg.png',
                  width: 150,
                ),
                Text(
                  'Sigh In',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Please enter your details to continue with your account',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.3),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldCustom(
                  label: 'Email Address',
                  hintText: 'Enter your email address',
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => TextFieldCustom(
                    label: 'Password',
                    hintText: 'Enter your Password',
                    isSequred: controller.isSequred.value,
                    treling: IconButton(
                        onPressed: () {
                          controller.isSequred.value =
                              !controller.isSequred.value;
                        },
                        icon: Icon(
                          controller.isSequred.value == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                        )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  label: 'Log In',
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      Get.to(()=> RegisterScreen());
                    },
                    child: Text(
                      'CREATE AN ACCOUNT',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.primary.withOpacity(.5),
                      ),
                    ))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
