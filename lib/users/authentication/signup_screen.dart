import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import '../../api_connection/api_connection.dart';
import 'login_screen.dart';

class SingUpScreen extends StatefulWidget {
  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  // form key declaration
  var formKey = GlobalKey<FormState>();
  //text field controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  validateUserEmail() async {
    try{
     var res= await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email': emailController.text.trim(),
        },
      );
      if(res.statusCode == 200){ // from flutter app the connection with API to server --- success
         var resBody=jsonDecode(res.body);
         if(resBody['emailFound'] == true){ //success is true // record is exist
           Fluttertoast.showToast(msg: "Email is already in Someone else use. try another email");
         }else{
           // register & save new user record to the database
         }
      }
    }catch(e){

    }
  }
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
                child: Image.asset("images/signup.jpg"),
              ),
              const SizedBox(height: 18,),
              // signup screen form
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
                                //name
                                TextFormField(
                                  controller: nameController,
                                  validator: (val) =>
                                      val == "" ? "Please write a Name" : null,
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      ),
                                      hintText: "name ...",
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
                                      if(formKey.currentState!.validate()){
                                        //validate the email
                                        validateUserEmail();
                                      }
                                    },
                                    borderRadius: BorderRadius.circular(30),
                                    child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 28,
                                        ),
                                      child: Text("Add Me",
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
                          // Already have  account and register btn
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an Account?",
                              style: TextStyle(color: Colors.orangeAccent),
                              ),
                              TextButton(
                                onPressed: (){
                                  Get.to(LoginScreen());
                                },
                                child: const Text(
                                  "Click to LogIn ",
                                  style: TextStyle(color: Colors.amberAccent),
                                ),
                                 ),
                            ],
                          ),

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
