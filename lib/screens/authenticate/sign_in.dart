import 'package:cafe_curator/services/auth.dart';
import 'package:cafe_curator/shared/border_design.dart';
import 'package:cafe_curator/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // State objects
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[900],

      body: Container(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 75),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/coffee_cup_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign-in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'to Cafe Curator!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New to Cafe Curator?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        widget.toggleView();
                      },
                      icon: Icon(
                        Icons.person, 
                        color: Colors.white,
                        size: 24,
                      ),
                      label: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextFormField(
                          validator: (value) => value!.isEmpty ? 'Enter your e-mail ID' : null,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: borderDesign.copyWith(hintText: 'Email ID'),
                        ),
                                      
                        SizedBox(height: 20,),
                        TextFormField(
                          obscureText: true,
                          validator: (value) => value!.length < 6 ? 'Your password must\'ve atleast 6 characters' : null,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: borderDesign.copyWith(hintText: 'Password'),
                        ),
                                      
                        SizedBox(height: 20,),
                        Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
              
                    ElevatedButton.icon(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth.signIn(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Invalid e-mail ID or password!';
                              loading = false;
                            });
                          }
                        }
                      }, 
                      label: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      icon: Icon(
                        Icons.login,
                        color: Colors.white,
                        size: 32,
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.brown[800]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}