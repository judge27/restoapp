import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../restoapp/model/LoginModel.dart';
import '../restoapp/screens/home_screen.dart';
import '../restoapp/screens/login_screen.dart';

Map<String,dynamic> headers ={
  "Accept":"application/json",
  "Content-Type":"application/json"
};
class DioHelper{


  static Dio? dio;
  static init(){
    dio =Dio(
        BaseOptions(
          baseUrl: "https://student.valuxapps.com/api/"  ,
          receiveDataWhenStatusError: true,
          connectTimeout: Duration(seconds:10),
          receiveTimeout: Duration(seconds: 10),
          responseType: ResponseType.json,
          headers: headers,
        )
    );
  }
  Future login({
    required String email,
    required String password})
  async{
    LoginModel model = LoginModel();
    try{
      var response = await dio!
          .post("login",data: {
        "email":email,
        "password":password,
      });
      model =LoginModel.fromJson(response.data);
      if(model.status==false){
        Get.snackbar(model.message??"","",backgroundColor: Colors.red);
        print(model.message);
      }
      else{
        Get.offAll(HomeScreen());
      }

    }
    catch(e){
      Get.snackbar("Check your internet connection", "Error",backgroundColor: Colors.red);
      
    }
  }
  Future register({
    required String name,
    required String email,
    required String password,
    required String phone

  })
  async{
    LoginModel regModel = LoginModel();
    try{
      var response = await dio!
          .post("register",data: {
        "name":name,
        "email":email,
        "password":password,
        "phone":phone,
      });
      regModel =LoginModel.fromJson(response.data);
      if(regModel.status==false){
        Get.snackbar(regModel.message??"","ex",backgroundColor: Colors.red);
        print(regModel.message);
      }
      else{
        Get.offAll(LoginScreen());
      }

    }
    catch(e){
      print(e);
    }
  }

}