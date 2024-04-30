import 'package:doorlock/Firebase/FirebaseAuthUserDatabase.dart';
import 'package:doorlock/Firebase/FirebaseUserDatabase.dart';
import 'package:doorlock/Models/Users/UserDTO.dart';
import 'package:doorlock/Utils/DialogUtils.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationView extends StatefulWidget {
  static const String routeName = "Registration";

  RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  FirebaseAuthUserDatabase authUserDatabase = injectFirebaseAuthUserDatabase();
  FirebaseUserDatabase userDatabase = injectFirebaseUserDatabase();

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmationController = TextEditingController();

  bool passwordVisible = false;

  bool passwordConfineVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
      ),
      body: ListView(
        keyboardDismissBehavior:
        ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(20.0),

        children: [
          SizedBox(
              height: 150,
              child: Builder(
                  builder: (context) {
                    return SvgPicture.asset("assets/svg/Logo.svg");
                  }
              )
          ),
          // white space between the from and image
          const SizedBox(
            height: 30,
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                // the text from field for the name
                TextFormField(
                  style: Theme.of(context).textTheme.bodyLarge,
                  controller: nameController,
                  validator: (value) {
                    return nameValidation(value ?? "");
                  },
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  cursorColor: Theme.of(context).primaryColor,
                  keyboardType: TextInputType.name,
                  cursorHeight: 20,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.person,
                      size: 30,
                    ),
                    hintText: "Name",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // the text from field for the email
                TextFormField(
                  style: Theme.of(context).textTheme.bodyLarge,
                  controller: emailController,
                  validator: (value) {
                    return emailValidation(value ?? "");
                  },
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  cursorColor: Theme.of(context).primaryColor,
                  keyboardType: TextInputType.emailAddress,
                  cursorHeight: 20,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      EvaIcons.email,
                      size: 30,
                    ),
                    hintText: "Email",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // the text from field for the email
                TextFormField(
                  style: Theme.of(context).textTheme.bodyLarge,
                  controller: passwordController,
                  validator: (value) {
                    return passwordValidation(value ?? "");
                  },
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  cursorColor: Theme.of(context).primaryColor,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !passwordVisible,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        EvaIcons.lock,
                        size: 30,
                      ),
                      hintText: "Password",
                      suffixIcon: InkWell(
                        onTap: changePasswordVisibility,
                        overlayColor: MaterialStateProperty.all(
                            Colors.transparent),
                        child: Icon(
                          passwordVisible
                              ? EvaIcons.eye
                              : EvaIcons.eyeOff,
                          size: 30,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                // the text from field for the email
                TextFormField(
                  style: Theme.of(context).textTheme.bodyLarge,
                  controller: passwordConfirmationController,
                  validator: (value) {
                    return passwordConfirmationValidation(
                        value ?? "");
                  },
                  autovalidateMode:
                  AutovalidateMode.onUserInteraction,
                  cursorColor: Theme.of(context).primaryColor,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !passwordConfineVisible,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        EvaIcons.lock,
                        size: 30,
                      ),
                      hintText: "Password Confirmation",
                      suffixIcon: InkWell(
                        onTap:
                        changePasswordConfirmVisibility,
                        overlayColor: MaterialStateProperty.all(
                            Colors.transparent),
                        child: Icon(
                          passwordConfineVisible
                              ? EvaIcons.eye
                              : EvaIcons.eyeOff,
                          size: 30,
                        ),
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // login button
          ElevatedButton(
              onPressed: createAccount,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create Account"),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          // create account button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already Have Account?",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                  onPressed: goToLoginScreen,
                  child: const Text("Login"),)
            ],
          ),
        ],
      ),
    );
  }

  // validate on the name if it is not empty and doesn't contain ant spacial characters
  String? nameValidation(String name) {
    if (name.isEmpty) {
      return "Name Can't be Empty";
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%-]').hasMatch(name)) {
      return "Invalid Name";
    } else {
      return null;
    }
  }

  // validate on the email form
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

  // validate the password is not less than 8 chars
  String? passwordValidation(String input) {
    if (input.isEmpty) {
      return "Password Can't be Empty";
    } else if (input.length < 8) {
      return "Invalid Password Length";
    }
    return null;
  }

  // validate the password confirmation is not empty and the same as the password
  String? passwordConfirmationValidation(String input) {
    if (input.isEmpty) {
      return "Password Can't be Empty";
    } else if (input != passwordController.text) {
      return "Password Doesn't Match";
    }
    return null;
  }

  // function to change password visibility
  changePasswordVisibility(){
    passwordVisible = !passwordVisible;
  }

  // function to change password confirm visibility
  changePasswordConfirmVisibility(){
    passwordConfineVisible = !passwordConfineVisible;
  }

  // navigation function
  goToLoginScreen(){
    Navigator.pop(context);
  }

  createAccount() async{
    if(formKey.currentState!.validate()){

      MyDialogUtils.showLoadingDialog(context: context, message: "Loading...");
      try {
        var user = MyUser(
            uid: "",
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            image: "");
        var response = await authUserDatabase.createUser(user: user);
        user.uid = response.uid;
        await userDatabase.createUser(user: user);
        MyDialogUtils.hideDialog(context);
        MyDialogUtils.showSuccessMessage(context: context, message:"Account Created Successfully" , posActionTitle: "ok" , posAction: (){
          Navigator.pop(context);
        });
      } catch (e) {
        MyDialogUtils.hideDialog(context);
        MyDialogUtils.showFailMessage(context: context, message:e.toString() , posActionTitle: "Ok");
      }

    }
  }
}
