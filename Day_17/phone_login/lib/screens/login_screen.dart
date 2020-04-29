import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phonelogin/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {

  final _phoneController = TextEditingController();
  final _codeContoller = TextEditingController();

  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential authCreds) async {
          Navigator.of(context).pop();
          AuthResult authResult = await _auth.signInWithCredential(authCreds);
          FirebaseUser user = authResult.user;
          if (user != null){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => HomeScreen(user: user)
            ));
          } else {
            print("error user is null");
          }
        },
        verificationFailed: (AuthException exception){
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context){
                return AlertDialog(
                  title: Text("Enter the OTP"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeContoller,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final code = _codeContoller.text.trim();
                        AuthCredential creds = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: code);
                        AuthResult res = await _auth.signInWithCredential(creds);
                        FirebaseUser usr = res.user;
                        if (usr != null){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => HomeScreen(user: usr)
                          ));
                        } else {
                          print("Error usr is null");
                        }
                      },
                    )
                  ],
                );
              }
          );
        },
        codeAutoRetrievalTimeout: null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Login", style: TextStyle(color: Colors.lightBlue, fontSize: 36.0, fontWeight: FontWeight.w500)),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.grey[200])
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey[300])
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: "Mobile Number"
                  ),
                  controller: _phoneController,
                ),
                SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  child: FlatButton(
                    child: Text("LOGIN"),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(16.0),
                    color: Colors.blue,
                    onPressed: (){
                      final phone = _phoneController.text.trim();
                      loginUser(phone, context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}