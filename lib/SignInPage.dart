import 'package:flutter/material.dart';
import 'package:lokalwala/ForgetPswPage.dart';
import 'package:lokalwala/OTPPage.dart';
import 'package:lokalwala/SignUpPage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
//          Container(),

          Positioned(
            top: 0,
            right: 0,
            child: Container(
                height: 220,
//                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/curve.png')),
          ),
          Positioned.fill(
            child: Image.asset(
              "assets/images/city.png",
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomLeft,
            ),
          ),
          Positioned(
              top: 200,
              left: 30,
              right: 30,
              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text("Sign in" , textAlign: TextAlign.left,style: TextStyle(color:  Color(0xff325DF9),fontSize: 24,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    cursorColor: Color(0xff325DF9),
                    maxLength: 10,

                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counter:Offstage(),
                      labelText: "Phone",
                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff325DF9))
                      ),
                      border:UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),),
                  ),
                  TextFormField(
                    cursorColor: Color(0xff325DF9),
                    maxLength: 4,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counter:Offstage(),
                      labelText: "Passcode",

                      labelStyle: TextStyle(color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff325DF9))
                      ),
                      border:UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),),
                  ),


                  SizedBox(height: 50,),

                  Align(alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPPage()));

                          },
                          child: new Container(
//                        width: 150.0,
//                        height: 5.0,
                            decoration: BoxDecoration(
                              color: Color(0xff325DF9),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:10.0,horizontal: 75),
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPswPage()));
                          },
                          child: Text("Forgot Passcode",style: TextStyle(fontWeight: FontWeight.w500,
                              color: Colors.black,
                              decoration: TextDecoration.underline),),
                        ),
                        SizedBox(height: 30,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("I\'m new here ",style: TextStyle(fontWeight: FontWeight.w500),),
                            InkWell(
                                onTap: (){

                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));

                                },
                                child: Text("Sign up ",style: TextStyle(fontWeight: FontWeight.w500,color: Color(0xff325DF9),
                                    decoration: TextDecoration.underline),)),

                          ],
                        )
                      ],
                    ),
                  ),


                ],
              )),



        ],
      ),
    );  }
}
