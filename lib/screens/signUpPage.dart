

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_quiz/authentication.dart';
import 'package:z_quiz/localWidgets/showError.dart';
import 'package:z_quiz/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  ///////not needed
    final _formKey = GlobalKey<FormState>();

  String _email, _password, _confirmPassword,_username;

  @override
  
  void initState() {
    super.initState();
    checkAuthentication();
    
  }

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        // Navigator.of(context).pop();

        Navigator.pushReplacementNamed(context,'/home');
      }
    });
  }

  signUp() async {
    
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_password == _confirmPassword) {
        try {
          FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
                  email: _email, password: _password))
              .user;
          if (user != null) {
            UserDetails().updateUser( _username, _email, user.uid, user);
            Firestore.instance.collection('users').document(user.uid).setData({
              'email': _email,
              'username':_username,
            });
            print('i printed this uid '+UserDetails().uid);
          }
        } catch (e) {
          showError("assets/images/iconImg/sad_face.png", e.message, context);
        }
      } else {
        showError("assets/images/iconImg/sad_face.png",
            "passwords do not match", context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           resizeToAvoidBottomInset: false,

      body: SafeArea(
        child:
          // SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Container(
                  constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                  // stops: [0.1, 0.9],
                  colors: <Color>[Color(0xff0000ff), Color(0xffafeeee)])),
              
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back,size: ScreenUtil().setSp(30),color: Colors.white,), onPressed: (){
                      Navigator.pop(context);
                    }),
                     Padding(
                       padding:  EdgeInsets.only(left:95.w),
                       child: Text(
                  "Sign up",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                ),
                     ),
                  ],
                ),
                SizedBox(height: 20.h,),
                 Padding(
                   padding:  EdgeInsets.only(left:138.w),
                   child: Image(
                          image: AssetImage(
                            'assets/images/logo.png',
                          ),
                          width: 70.w,
                          height: 90.h,
                          // height: 600,
                        ),
                 ),
                Spacer(flex: 1), //2/6
               
               
                // 1/6
                Form(
            key: _formKey,

                  child: Column(
                    children: [
                 Container(                    margin: EdgeInsets.only(left: 40.w, right: 40.w),

                   child: TextFormField(
                     validator:  (input) {
                      if (input.isEmpty) {
                        return 'Enter a valid email';
                      }
                    },
                    onSaved: (input) => _email = input,
                    decoration: InputDecoration( 
                      
                      filled: true,
                      // fillColor: Color(0xFF1C2341),
                      fillColor: Colors.white,
                      hintText: "email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                ),
                 ),                         SizedBox(height: 30.h,),

                        Container(                    margin: EdgeInsets.only(left: 40.w, right: 40.w),

                          child: TextFormField(
                  decoration: InputDecoration( 
                    
                    filled: true,
                    // fillColor: Color(0xFF1C2341),
                    fillColor: Colors.white,
                    hintText: "UserName",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                   validator:  (input) {
                    if (input.isEmpty) {
                      return 'Provide an Username';
                    }
                  },
                  onSaved: (input) => _username = input,
                  
                ),
                        ),
                SizedBox(height: 30.h,),
                 Container(                    margin: EdgeInsets.only(left: 40.w, right: 40.w),

                   child: TextFormField(                  obscureText: true,

                     validator:  (input) {
                      if (input.isEmpty) {
                        return 'Provide a Password';
                      }
                    },
                    onSaved: (input) => _password = input,
                    decoration: InputDecoration( 
                      
                      filled: true,
                      // fillColor: Color(0xFF1C2341),
                      fillColor: Colors.white,
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                ),
                 ),
                 SizedBox(height: 30.h,),
                 Container(                    margin: EdgeInsets.only(left: 40.w, right: 40.w),

                   child: TextFormField(                  obscureText: true,

                     validator:  (input) {
                      if (input.isEmpty) {
                        return 'Passwords does not match';
                      }
                    },
                    onSaved: (input) => _confirmPassword = input,
                    decoration: InputDecoration( 
                      
                      filled: true,
                      // fillColor: Color(0xFF1C2341),
                      fillColor: Colors.white,
                      hintText: "confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                ),
                 ),
                    ],
                  ),
                ),
                
                Spacer(), // 1/6
                Center(
                  child: GestureDetector(
                 onTap: () =>
                      signUp(),
                  child: Container(
                    width: 132.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2
,color: Colors.white                      ),
                      color: Color(0xff1E90FF),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: Text(
                        'Sign up',
                        
                        
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ), 
                ),
                SizedBox(height: 20.h,),
               Center(
                 child: GestureDetector(
                  onTap: () => Authentication().googleSignIn(),

                  child: Container(
                    width: 170.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [SizedBox(width: 5.w,),
                        Image(
                          image: AssetImage('assets/images/Google_image.png'),
                          width: 25.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text('Sign up with Google',
                        style: TextStyle(fontSize: ScreenUtil().setSp(14),fontWeight: FontWeight.w600,color: Colors.white),
                        )
                      ],
                    ),
                  ),
              ),
               ),
                Spacer(flex: 2), // it will take 2/6 spaces
              ],
            ),
          ),
       
      )
    );
  }
}