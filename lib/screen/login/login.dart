import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coffee_app/screen/signin/signin.dart';
import 'package:coffee_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
  Login({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(child: Image.asset('assets/images/undraw_drink-coffee_q0ey.png')),
          SizedBox(
          width: double.infinity,
          child: TextLiquidFill(
            text: 'به دنیای قهوه خوش اومدی :)',
            waveColor: greenColor,
            boxBackgroundColor: Colors.white,
            textStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 150.0,
          ),
        ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 40),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    spacing: 30,
                    children: [
                      TextFormField(
                        controller: _phoneController,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.grey,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(
                                width: 1,
                                color: brownColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: brownColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(30)),
                            ),
                            hintText: "مثال: 09149812128",
                            hintStyle: TextStyle(
                            color: Color.fromARGB(255, 123, 123, 123)),
                            labelText: "شماره تلفن همراه",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'لطفا شماره تلفن خود را وارد کنید';
                            } else if (value.length < 11) {
                              return 'شماره تلفن نامعتبر است';
                            } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                              return 'شماره تلفن نامعتبر است';
                            } else {
                              return null;
                            }
                          },
                        ),

                        TextFormField(
                        controller: _passwordController,
                          obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.grey,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              borderSide: BorderSide(
                                width: 1,
                                color: brownColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: brownColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(30)),
                            ),
                            hintStyle: TextStyle(
                            color: Color.fromARGB(255, 123, 123, 123)),
                            labelText: "رمز عبور",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'لطفا رمز خود را وارد کنید';
                            } else if (value.length < 8) {
                              return 'رمز حداقل باید دارای 8 کاراکتر باشد';
                            } else {
                              return null;
                            }
                          },
                        ),

                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: brownColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(child: Text('ورود', style: TextStyle(fontSize: 19),),),
                          ),
                        ),

                        InkWell(
                         child: GestureDetector(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
                           },
                           child: Text(
                             "حساب کاربری ندارید؟ ثبت نام کنید",
                             style: TextStyle(
                               color: Colors.grey,
                               fontSize: 17,
                               fontWeight: FontWeight.w500
                             ),
                           ),
                         ),
                        ),
                    ],
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}