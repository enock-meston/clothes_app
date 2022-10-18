import 'package:clothes_app/users/authentication/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key declaration
  var formKey = GlobalKey<FormState>();
  //text field controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(builder: (context, cons) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: cons.maxHeight),
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 285,
                child: Image.asset("images/login.jpg"),
              ),
              const SizedBox(height: 18,),
              // loging screen form
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.all(
                        Radius.circular(60),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black26,
                          offset: Offset(0, -3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30.0,30.0,30.0,8.0),
                      child: Column(
                        children: [
                          //email - password - login btn
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                //email
                                TextFormField(
                                  controller: emailController,
                                  validator: (val) =>
                                      val == "" ? "Please write Email" : null,
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.email,
                                        color: Colors.black,
                                      ),
                                      hintText: "email ...",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        )),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        )),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 6,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),

                                ),

                                const SizedBox(height: 18,),
                                //password
                                Obx(() => TextFormField(
                                  controller: passwordController,
                                  obscureText: isObsecure.value,
                                  validator: (val) =>
                                  val == "" ? "Please write Password" : null,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      Icons.vpn_key_sharp,
                                      color: Colors.black,
                                    ),
                                    suffixIcon: Obx(()=>GestureDetector(
                                      onTap: (){
                                        isObsecure.value = !isObsecure.value;
                                      },
                                      child: Icon(
                                        isObsecure.value ? Icons.visibility_off : Icons.visibility,
                                        color: Colors.black,
                                      ),
                                    ),),
                                    hintText: "Password ...",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        )),
                                    disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        )),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 6,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),

                                ),),

                                const SizedBox(height: 18,),

                                //button
                                Material(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30),
                                  child: InkWell(
                                    onTap: (){

                                    },
                                    borderRadius: BorderRadius.circular(30),
                                    child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 28,
                                        ),
                                      child: Text("Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      ),

                                    ),

                                  ),
                                ),

                              ],
                            ),
                          ),

                          const SizedBox(height: 16.0,),
                          // don't have an account and register btn
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an Account?",
                                  style: TextStyle(color: Colors.orangeAccent),
                              ),
                              TextButton(
                                onPressed: (){
                                  Get.to(SingUpScreen());
                                },
                                child: const Text(
                                  "Register Here",
                                  style: TextStyle(color: Colors.amberAccent),
                                ),
                                 ),
                            ],
                          ),

                          const Text("OR",style: TextStyle(color: Colors.black45),),
                          //admin text with Button?

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Are you an Admin?",
                              style: TextStyle(color: Colors.orangeAccent)),
                              TextButton(
                                onPressed: (){

                                },
                                child: const Text(
                                  "Click Here",
                                  style: TextStyle(color: Colors.amberAccent),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
              // end of login form
            ],
          )),
        );
      }),
    );
  }
}
