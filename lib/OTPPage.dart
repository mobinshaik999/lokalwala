import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
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
                   child:  RichText(
                     text: TextSpan(
                         style: TextStyle(
                           fontSize: 24,
                             color: Color(0xff325DF9),),
                         children: <TextSpan>[
                           TextSpan(text: "Verify your mobile\n"),
                           TextSpan(
                               text: "With OTP",
                               style: TextStyle(
                                   fontWeight: FontWeight.w600,
                                   color: Color(0xff325DF9),)),
                         ]),
                   ),
                  ),
                  SizedBox(height: 60,),
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
                            Toast.show("OTP verified Successfully", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

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
                                'VERIFY OTP',
                                style: TextStyle(fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50,),
                        Text("Not yet received OTP",style: TextStyle(fontWeight: FontWeight.w500,
                            color: Colors.black),),
                        SizedBox(height: 30,),

                        InkWell(
                            onTap: (){
                              Toast.show("OTP is sent successfully", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

                            },
                            child: Text("Resend OTP ",
                              style: TextStyle(fontWeight: FontWeight.w800,letterSpacing: 1,
                                decoration: TextDecoration.underline),))
                      ],
                    ),
                  ),


                ],
              )),



        ],
      ),
    );  }
}
