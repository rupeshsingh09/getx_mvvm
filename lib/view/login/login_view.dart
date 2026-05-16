import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/res/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  // check krenge ki user  ne mail dala h ya hhi agr dala h to shi dala h ki nhi, in short form validation
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('login'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // getxcontroller bnaye h kyuki yha p loginview ko desihgn kre
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginVM.emailController.value,
                    focusNode: loginVM.emailFocusNode.value,
                    // email check krne k liye
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snakBar('Email', 'Enter email');
                      }
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                        context,
                        loginVM.emailFocusNode.value,
                        loginVM.passwordFocusNode.value,
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'email_hint'.tr,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    controller: loginVM.passwordController.value,
                    focusNode: loginVM.passwordFocusNode.value,
                    // password hide krnr ke liye
                    obscureText: true,
                    obscuringCharacter: '*',
                    // email check krne k liye
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snakBar('Password', 'Enter password');
                      }
                    },
                    onFieldSubmitted: (value) {},
                    decoration: InputDecoration(
                      hintText: 'password_hint'.tr,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            // jo round button banaye te usko use krenge yha
            SizedBox(height: 40),
            Obx(
              () => RoundButton(
                width: 200,
                title: 'login'.tr,
                loading: loginVM.loading.value,
                onPress: () {
                  if (_formkey.currentState!.validate()) {}
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
