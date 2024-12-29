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
        title: Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Get.back(), icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => InkWell(
                    onTap: () => controller.pickedImage(),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: controller.selectedImage.value.path == ''
                              ? null
                              : DecorationImage(
                                  image: FileImage(
                                    controller.selectedImage.value,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                          shape: BoxShape.circle,
                          color: AppColor.primary),
                      child: Icon(
                        controller.selectedImage.value.path == '' ? Icons.add : null,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldCustom(
                  onChanged: (value) {
                    controller.userModel.value.name = value;
                  },
                  label: 'Name',
                  hintText: 'Enter your Name',
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldCustom(
                  onChanged: (value) {
                    controller.userModel.value.phone = value;
                  },
                  label: 'Phone',
                  hintText: 'Enter your Phone Number',
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldCustom(
                  onChanged: (value) {
                    controller.userModel.value.email = value;
                  },
                  label: 'Email Address',
                  hintText: 'Enter your email address',
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldCustom(
                  onChanged: (value) {
                    controller.userModel.value.dateOfBirth = value;
                  },
                  label: 'Date Of Birth',
                  hintText: 'yyyy-mm-dd',
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(
                  () => TextFieldCustom(
                    onChanged: (value) {
                      controller.userModel.value.password = value;
                    },
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
                  onTap: ()=> controller.registration(),
                  label: 'Sign Up',
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => RegisterScreen());
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
