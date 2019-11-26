import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lokalwala/SignInPage.dart';
import 'package:parallax_image/parallax_image.dart';
import 'package:toast/toast.dart';


final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  List<String> genders = [];

  String gender;

  String selected;

  bool autoValidate = false;
  Color textColor = Colors.grey;



  @override
  void initState() {
    // TODO: implement initState
    genders.add("Male");
    genders.add("Female");
    genders.add("Other");

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Container(
                height: 220,
//                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/curve.png')),
          ),
//          Positioned(
//              bottom: 0,
//              right: 0,
//              left: 0,
//              child: Container(
//                  height: 200,
//                  width: MediaQuery.of(context).size.width,
//                  child: Image.asset('assets/images/city.png'))),
          Positioned.fill(
            child: Image.asset(
              "assets/images/city.png",
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomLeft,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left:25.0),
                  child: Text(
                    "Create Account",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff325DF9),
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:35.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          cursorColor: Color(0xff325DF9),
                          validator: valiadeFullname,
                          autovalidate: autoValidate,
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff325DF9))),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Gender",
                          style:
                          TextStyle(color:textColor, fontSize: 16),
                        ),
                        Container(
                          height: 40,
                          child: ListView.builder(
                              itemCount: genders.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected = genders[index];
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 18.0,
                                        height: 18.0,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0,
                                            horizontal: 2.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.black),
                                            color:
                                            genders[index] == selected
                                                ? Color(0xff325DF9)
                                                : Colors.transparent),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      new Text(
                                        genders[index],
                                        style:
                                        new TextStyle(fontSize: 14.0),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),


                        TextFormField(
                          cursorColor: Color(0xff325DF9),
                          validator: validateEmail,
                          autovalidate: autoValidate,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff325DF9))),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        TextFormField(
                          cursorColor: Color(0xff325DF9),
                          maxLength: 10,
                           autovalidate: autoValidate,
                          validator: validateMobile,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            counter: Offstage(),
                            labelText: "Phone",
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff325DF9))),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          maxLength: 4,
                          validator: validatepasscode,
                          autovalidate: autoValidate,
                          cursorColor: Color(0xff325DF9),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Passcode",
                              counter: Offstage(),
                              labelStyle: TextStyle(color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff325DF9))),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              helperText:
                                  "PassCode is a 4(four) digits Unique pin.",
                              helperStyle:
                                  TextStyle(color: Colors.grey, fontSize: 8)),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          validateForm();
                        },
                        child: new Container(
                          decoration: BoxDecoration(
                            color: Color(0xff325DF9),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 100),
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an account ",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
//                                  Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) => SignInPage()));
                              },
                              child: Text(
                                "Sign In ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff325DF9),
                                    decoration: TextDecoration.underline),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0 ||!regExp.hasMatch(value) ) {
      return 'Please enter  Valid mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;

  }

  validateForm(){

    if(selected == null){
      setState(() {
        textColor = Colors.red[300];
      });

    }else{
      setState(() {
        textColor = Colors.grey;

      });
    }
  final form = _formKey.currentState;
  if (form.validate() && selected == null ) {

  form.save();
  Toast.show("Successfully creaed user", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);



  }else{
    setState(() {
      autoValidate = true;

    });
  }


  }


  String valiadeFullname(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);

    if (value.isEmpty||value.length < 3||!(regExp.hasMatch(value))) {
      return "Please enter a valid name ";
    }
    else {

      return null;
    }
  }


  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.trim().isEmpty) {
      return 'Email is required';
    } else if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else
      return null;
  }

  String validatepasscode(String value) {
    String pattern = r'^[0-9]{4}$';
    RegExp regex = new RegExp(pattern);

    if (value.trim().isEmpty) {
      return 'Passcode is required';
    } else if (!regex.hasMatch(value)) {
      return 'Minimum 4 digits required';
    } else
      return null;
  }


}
