import 'package:flutter/material.dart';
import 'package:restourant_mobile_project/core/utils/app_colors.dart';
import 'package:restourant_mobile_project/features/login/widgets/login_or_register_button.dart';
import 'package:restourant_mobile_project/features/login/widgets/input_field.dart';
import '../../../core/utils/dio.dart';
import '../../categories/pages/categoriesPage.dart';

Future<String> login({required String email, required String password}) async {
  try{
    var response = await DioClient.dio.post(
      "/auth/login",
      data: {'login': email, 'password': password},
    );
    if (response.statusCode != 200) {
      throw Exception(response.data);
    }
    return response.data['accessToken'];

  }catch(e){
    return "Error";
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFFFD5D69),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            spacing: 10,
            children: [
              SizedBox(
                height: 152,
              ),
              LoginInput(
                outputLabelText: "Email",
                inputLabelText: "example@example.com",
                controller: emailController,
              ),
              LoginInput(
                outputLabelText: "Password",
                inputLabelText: "● ● ● ● ● ● ● ●",
                controller: passwordController,
              ),
              SizedBox(
                height: 89,
              ),
              Column(
                spacing: 27,
                children: [
                  LoginOrRegisterButton(
                    buttonText: 'Log In',
                    buttonBackgroundColor: AppColors.appBarTextColor,
                    buttonTextColor: AppColors.categoryName,
                    onPressed: () async {
                      var token = await login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(token),
                        ),
                      );
                      if(token.startsWith('eyJhb')){
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => MyCategoriesPage(),
                          ),
                        );
                      }
                    },
                  ),
                  LoginOrRegisterButton(
                    buttonText: 'Sign Up',
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 67,
              ),
              Text(
                "Forgot Password?",
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
