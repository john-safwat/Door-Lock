import 'package:doorlock/Firebase/FirebaseAuthUserDatabase.dart';
import 'package:doorlock/Utils/DialogUtils.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPasswordView extends StatefulWidget {
  static const String routeName = "ForgetPassword";
  ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final formKey = GlobalKey<FormState>();
  FirebaseAuthUserDatabase authUserDatabase = injectFirebaseAuthUserDatabase();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
      body: Column(
        children: [
          Expanded(child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20,),
                  SvgPicture.asset("assets/svg/Forgot.svg" , fit: BoxFit.cover,),
                  const SizedBox(height: 20,),
                  // the text from field for the email
                  Form(
                    key: formKey,
                    child: TextFormField(
                      style: Theme.of(context).textTheme.bodyLarge,
                      controller: emailController,
                      validator: (value) {
                        return emailValidation(value ?? "");
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.emailAddress,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          EvaIcons.email,
                          size: 30,
                        ),
                        hintText: "Email",
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: resetPassword,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Send Email"),
                      )
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  // validation function
  String? emailValidation(String input) {
    if (input.isEmpty) {
      return "Email Can't be Empty";
    } else if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+"
    r"@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(input)) {
      return "Enter Valid Email";
    }
    return null;
  }

  // function reset password
  Future<void>resetPassword()async {

    if(formKey.currentState!.validate()){
      MyDialogUtils.showLoadingDialog(context: context, message: "Loading....");
      try{
        await authUserDatabase.resetPassword(email: emailController.text);
        MyDialogUtils.hideDialog(context);
        MyDialogUtils.showSuccessMessage(context: context, message: "Email Sent Successfully" , posActionTitle: "ok" , posAction: goToHomeScreen);
      }catch(e){
        MyDialogUtils.hideDialog(context);
        MyDialogUtils.showSuccessMessage(context: context, message: e.toString() , posActionTitle: "ok");
      }
    }

  }

  void goToHomeScreen() {
    Navigator.pop(context);
  }
}
