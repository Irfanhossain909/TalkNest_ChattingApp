import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controllers/auth_controller.dart';
import '../../../utils/Color.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_feiled.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: ()=> Get.back(), icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15,0,15,15),
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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Please enter your details to create new account',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.3),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFieldCustom(
                  label: 'Name',
                  hintText: 'Enter your Name',
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldCustom(
                  label: 'Phone',
                  hintText: 'Enter your Phone Number',
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldCustom(
                  label: 'Email Address',
                  hintText: 'Enter your email address',
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldCustom(
                  label: 'Date Of Birth',
                  hintText: 'yyyy-mm-dd',
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
                  label: 'Sign Up',
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      Get.to(()=> RegisterScreen());
                    },
                    child: Text(
                      'ALREADY HAVE AN ACCOUNT',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColor.primary.withOpacity(.5),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
