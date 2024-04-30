import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatefulWidget {

  static const String routeName = "login";
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // define the from key and text field controller
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(20),
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
          // from to get user input
          Form(
            key: formKey,
            child: Column(
              children: [
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
                  obscureText: !visible,
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
                          visible
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
            height: 10,
          ),
          // forget password button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: goToForgetPasswordScreen,
                  child: const Text("Forget Password ?")),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // login button
          ElevatedButton(
              onPressed: signInWithEmailAndPassword,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login"),
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
                "Don't Have Account? ",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                  onPressed: goToRegisterScreen,
                  child: const Text("Create Account")),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // or space
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              const Expanded(child: Divider()),
              const SizedBox(
                width: 10,
              ),
              Text(
                "or",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(child: Divider()),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // login button
          ElevatedButton(
              onPressed: loginWithGoogle,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      EvaIcons.google,
                      color: Theme.of(context)
                          .secondaryHeaderColor,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const FittedBox(
                        child:
                        Text("Login With Google")),
                  ],
                ),
              )),
          const SizedBox(
            height: 20,
          ),

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

  // validate the password is not less than 8 chars
  String? passwordValidation(String input) {
    if (input.isEmpty) {
      return "Password Can't Be Empty";
    } else if (input.length < 8) {
      return "Invalid Password";
    }
    return null;
  }

  // function to change password visibility
  changePasswordVisibility() {
    setState(() {
      visible = !visible;
    });
  }


  // navigation functions
  // function to go to the registration screen
  goToRegisterScreen() {

  }

  // function to go to forgetPassword screen
  goToForgetPasswordScreen() {

  }

  Future<void> signInWithEmailAndPassword() async {}
  void loginWithGoogle()async{}

}
