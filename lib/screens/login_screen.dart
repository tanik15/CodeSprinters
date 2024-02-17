import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool isObscure = true;
  bool isLoading = false;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff292c34),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              elevation: 5,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: size.height * 0.45,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: Text("WELCOME",
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18, top: 5),
                              child: Text("Please login to continue",
                                  style: Theme.of(context).textTheme.bodyLarge),
                            ),
                          ),
                          Image.asset(
                            'assets/logo.png',
                            height: size.height * 0.3,
                            fit: BoxFit.contain,
                          ),
                         
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Login Account",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Username",
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: size.width * 0.8,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                              color: const Color.fromARGB(
                                  255, 69, 120, 162)), // Border color
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: username,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                // setState(() {
                                //   isLoading = false;
                                // });
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Enter valid Username")));
                                return null;
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: Colors.black54,),
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.mail,
                                    size: 20,
                                  )),
                              hintText: 'Enter Username',
                              contentPadding: const EdgeInsets.only(
                                  left: 20, top: 15, bottom: 12),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Password",
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: size.width * 0.8,
                          height: 45,
                          decoration: BoxDecoration(
                            // color: const Color.fromARGB(255, 136, 191, 236),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                                color: const Color.fromARGB(255, 69, 120, 162)),
                          ),
                          child: Center(
                            child: TextFormField(
                              obscureText: isObscure,
                              controller: password,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Enter valid Username & Password")));
                                  return null;
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObscure = !isObscure;
                                      });
                                    },
                                    icon: (isObscure)
                                        ? const Icon(
                                            Icons.remove_red_eye,
                                            size: 20,
                                          )
                                        : const Icon(
                                            Icons.remove_red_eye_outlined,
                                            size: 20,
                                          )),
                                hintText: 'Enter Password',
                                contentPadding: const EdgeInsets.only(
                                    left: 20, top: 15, bottom: 12),
                                border: InputBorder.none,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.black54,
                                    ),
                              ),
                            ),
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: size.width * 0.1),
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/homeScreen');
                              },
                              child: Text(
                                "Login as teacher",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: size.width * 0.8,
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xff64edcc),
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                              color: const Color.fromARGB(255, 119, 176, 223)),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 3,
                              backgroundColor:
                                  const Color(0xff64edcc)),
                          onPressed: () async {
                            Navigator.pushNamed(context, '/homeScreen');
                          },
                          child: (isLoading)
                              ? const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  "Log in",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.white),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
