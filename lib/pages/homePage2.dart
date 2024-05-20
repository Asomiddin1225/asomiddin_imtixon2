import 'package:asomiddin_imtixon/pages/homePage4.dart';
import 'package:asomiddin_imtixon/pages/homePage3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, dynamic>? user;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? emailError;

  String? passwordError;
  String userError = "";

  void login() {
    validateEmail();
    validatePassword();

    if (emailError == null && passwordError == null) {
      if (user == null) {
        userError = "Foydalanuvchi topilmadi, iltimos ro'yxatdan o'ting";
        setState(() {});
      } else {
        if (user!['email'] == emailController.text &&
            user!['password'] == passwordController.text) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) {
                return HomePage4();
              },
            ),
          );
        } else {
          userError = "Email yoki parol xato";
          setState(() {});
        }
      }
    }
  }

  void validateEmail() {
    String email = emailController.text;

    setState(() {
      if (email.isEmpty) {
        emailError = "Iltimos elektron pochta kiriting";
      } else if (!email.contains("@") ||
          !email.substring(email.indexOf("@")).contains(".")) {
        emailError = "To'g'ri elektron pochta kiriting";
      } else {
        emailError = null;
      }
    });
  }

  void validatePassword() {
    String password = passwordController.text;

    setState(() {
      if (password.isEmpty) {
        passwordError = "Iltimos parol kiriting";
      } else {
        passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Text(
                  "Hello,",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Text("Welcome Back!",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (userError.isNotEmpty)
              Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    userError,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
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
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                // prefixIcon: const Icon(Icons.email),       // icon qo'yish
                hintText: "Enter Email?",
                // labelText: "Email",
                errorText: emailError,
              ),
              onChanged: (value) {
                validateEmail();
              },
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Enter Password",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                // prefixIcon: const Icon(Icons.key_sharp),          //Boshiga Icon qo'yish
                // suffixIcon: IconButton(               // oxriga Icon Qo'yish
                //   onPressed: () {},
                //   icon: const Icon(CupertinoIcons.eye_slash),
                // ),
                hintText: "Enter Password",
                // labelText: "Enter Password",
                errorText: passwordError,
              ),
              onChanged: (value) {
                validatePassword();
              },
              onSubmitted: (value) {
                login();
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                user = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return const RegisterPage();
                    },
                  ),
                );
                print(user);
                if (user != null) {
                  setState(() {});
                }
              },
              child: const Row(
                children: [
                  Text(
                    "Forgot PassWord?",
                    style: TextStyle(color: Colors.orange, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: login,
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/4.png',
                ),
                const SizedBox(width: 8),
                const Text(
                  "Or Singn In With",
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
                  onPressed: () async {
                    user = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return const RegisterPage();
                        },
                      ),
                    );
                    print(user);
                    if (user != null) {
                      setState(() {});
                    }
                  },
                  child: Image.asset(
                    'assets/google.png',
                    height: 100,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    user = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return const RegisterPage();
                        },
                      ),
                    );
                    print(user);
                    if (user != null) {
                      setState(() {});
                    }
                  },
                  child: Image.asset(
                    'assets/feyzbok.png',
                    height: 100,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an an account?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    user = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return const RegisterPage();
                        },
                      ),
                    );
                    print(user);
                    if (user != null) {
                      setState(() {});
                    }
                  },
                  child: const Text(
                    "Sign up here",
                    style: TextStyle(color: Colors.orange, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
