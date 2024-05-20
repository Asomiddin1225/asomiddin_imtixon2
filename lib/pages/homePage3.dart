import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  String text1 = "";
  String text2 = "Terms and Conditions You are not accepted";
  bool isIconChecked = false;
  String name = "";
  String email = "";
  String password = "";
  String passwordConfirm = "";

  void register() {
    if (formKey.currentState!.validate() && isIconChecked) {
      formKey.currentState!.save();

      Map<String, dynamic> user = {
        "name": name,
        "email": email,
        "password": password,
        "passwordConfirm": passwordConfirm,
      };

      Navigator.of(context).pop(user);
    } else {
      text1 = text2.toString();

      setState(() {});
    }
  }

  void _toggleIcon() {
    setState(() {
      isIconChecked = !isIconChecked;
    });
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos ism kiriting";
    } else if (value.length < 4) {
      return "Iltimos uzunroq ism kiriting";
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos elektron pochta kiriting";
    } else if (!value.contains("@") ||
        !value.substring(value.indexOf("@")).contains(".")) {
      return "To'g'ri elektron pochta kiriting";
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos parol kiriting";
    } else if (value.length < 8) {
      return "Iltimos eng kamida 8ta element kiriting";
    }

    return null;
  }

  String? validatePasswordConfirm(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos parolni tasdiqlang";
    } else if (value != passwordController.text) {
      return "Parollar mos kelmadi";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Create an account",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      "Let's help you set up your account,\nit won't take long",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Your name",
                  ),
                  validator: validateName,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      name = newValue;
                    }
                  },
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Email",
                  ),
                  validator: validateEmail,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      email = newValue;
                    }
                  },
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Password",
                  ),
                  validator: validatePassword,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      password = newValue;
                    }
                  },
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Retype Password",
                  ),
                  validator: validatePasswordConfirm,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      passwordConfirm = newValue;
                    }
                  },
                  onFieldSubmitted: (value) {
                    register();
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isIconChecked
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: Colors.orange,
                      ),
                      onPressed: _toggleIcon,
                    ),
                    const Text("Accept terms & Condition",
                        style: TextStyle(
                          color: Colors.orange,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(text1),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF129575),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/4.png',
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Or Sign In With",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      'assets/4.png',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Image.asset(
                        'assets/google.png',
                        height: 100,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Image.asset(
                        'assets/feyzbok.png',
                        height: 100,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member? ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(color: Colors.orange, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
