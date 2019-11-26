import 'package:flutter/material.dart';
import 'package:lokalwala/OTPPage.dart';

class ForgetPswPage extends StatefulWidget {
  @override
  _ForgetPswPageState createState() => _ForgetPswPageState();
}

class _ForgetPswPageState extends State<ForgetPswPage> {
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

                    child: Text("Recover \nyour passcode" , textAlign: TextAlign.left,style: TextStyle(color:  Color(0xff325DF9),fontSize: 24,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(height: 75,),
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

                  SizedBox(height: 50,),

                  Align(alignment: Alignment.center,
                    child: InkWell(
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
                            'SEND OTP',
                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              )),



        ],
      ),
    );  }
}
