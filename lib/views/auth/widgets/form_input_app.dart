import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/views/auth/widgets/custom_filled_button.dart';
import 'package:warehouse/views/pages/home_view.dart';
import '../login/login_controller.dart';
import 'custom_textfield.dart';

class FormInputApp extends StatefulWidget {
  const FormInputApp({super.key});

  @override
  State<FormInputApp> createState() => _FormInputAppState();
}

class _FormInputAppState extends State<FormInputApp> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void login() async {
    isLoading = true;
    setState(() {});
    LoginController controller = LoginController();
    var message = await controller.loginUser(
      endPoint: 'hello',
      data: {
        'username': userNameController.text,
        'password': passwordController.text,
      },
    );
    if (message.isSuccess) {
      showMessage(message: message.message, type: MessageType.success);
      Get.off(
        const HomePage(),
        transition: Transition.zoom,
        duration: const Duration(milliseconds: 1000),
      );
    } else {
      showMessage(message: message.message);
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Username",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextField(
            labelText: "Enter your username",
            prefixIcon: Icons.account_circle_rounded,
            controller: userNameController,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Password",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextField(
            labelText: "Enter your Password",
            prefixIcon: Icons.lock,
            isPassword: true,
            controller: passwordController,
          ),
          const SizedBox(
            height: 3,
          ),
          const SizedBox(
            width: double.infinity,
            child: Text(
              "Forget Password?",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue),
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: SizedBox(
                height: 50,
                child:isLoading? const Center(child: CircularProgressIndicator(),) :CustomFilledButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    if (formKey.currentState!.validate()) {
                      login();
                    } else {
                      autovalidateMode = AutovalidateMode.onUserInteraction;
                      setState(() {});
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}
