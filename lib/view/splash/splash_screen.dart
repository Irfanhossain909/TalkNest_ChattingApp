import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talknest/core/services/shared_services.dart';
import 'package:talknest/view/auth/login/login_screen.dart';
import 'package:talknest/view/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), (){
      checkToken();
    });
  }

  checkToken() async{
    final token = await SharedServices.getData(SetType.string, 'token');

    if(token != null){
      Get.offAll(()=> const HomeScreen());
    }else{
      Get.offAll(()=> const LoginScreen());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/bg.png',width: 300,),
      ),
    );
  }
}
