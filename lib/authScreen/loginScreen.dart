import 'package:flutter/material.dart';
import 'package:renpay/widgets/bottomNavBar.dart';

import '../HomeScreen.dart';




class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  String? _validateOTP(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    } else if (value.length != 6 || !_isNumeric(value)) {
      return 'OTP must be 6 numeric digits';
    }
    return null;

  }
  bool _isNumeric(String? value) {
    if (value == null) {
      return false;
    }
    return int.tryParse(value) != null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform login here
      String phoneNumber = _phoneNumberController.text;
      String otp = _otpController.text;

      // Example login logic:
      if (phoneNumber == _phoneNumberController.text && otp == _otpController.text) {
        // Successful login
        // You can navigate to the next screen or perform any other actions here.
        // For example, you can use Navigator.push() to navigate to a new screen.
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()),
        );
      } else {
        // Failed login
        // You can show an error message to the user, e.g., using a SnackBar or AlertDialog.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed. Please check your credentials.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login',style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Image(image: AssetImage("asset/logo.png"),height: 100,),
              SizedBox(height: 50,),
              TextFormField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(

                  prefixIcon: Icon(Icons.phone,color: Colors.deepPurple,),
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.deepPurple),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.deepPurple
                    )
                  ),
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: _validatePhoneNumber,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,color: Colors.deepPurple,),
                  labelText: 'OTP',
                  labelStyle: TextStyle(color: Colors.deepPurple),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.deepPurple
                      )
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: _validateOTP,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.deepPurple)
                ),
                onPressed: _submitForm,
                child: Text('Log In',style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


