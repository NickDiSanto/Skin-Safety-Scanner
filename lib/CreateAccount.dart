import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/ScreeningBreakdown.dart';
import 'package:ss_skin_project/dbOperations.dart';

import 'Constants.dart';

// class for the create account screen
class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  List<TextEditingController> controller = [TextEditingController(), TextEditingController(),
  TextEditingController(), TextEditingController()];
  final formKey = GlobalKey<FormState>();

  static const backgroundColor = Constants.cyan2;//Constants.teal; //Constants.tealAccent;
  static const buttonColor = Constants.white;// Constants.cyan; // Constants.cyan;
  static const textColor = Colors.black;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
     child:
     Scaffold(
       backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Skin Safety Scanner',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: textColor,
        )),
        centerTitle: true,
        backgroundColor: backgroundColor,
        iconTheme: const IconThemeData(
          color: textColor,
        )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
            child: const Text(
              'Create Account',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 34
              ),
            ),
          ),
          Flexible (
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    //TO DELETE
                    onChanged: (text) async {
                      try {
                        var collectionRef = FirebaseFirestore.instance.collection('User');
                        var doc = await collectionRef.doc(text).get();
                        doc.exists;
                      } catch(e) {
                        rethrow;
                      }
                    },
                    controller: controller.elementAt(0),
                    maxLength: 20,
                    decoration: const InputDecoration(
                      fillColor: Constants.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: textColor
                          )
                      ),
                      labelText: 'First Name',
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: controller.elementAt(1),
                    maxLength: 20,
                    decoration: const InputDecoration(
                      fillColor: Constants.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: textColor
                          )
                      ),
                      labelText: 'Last Name',
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: controller.elementAt(2),
                    maxLength: 40,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      fillColor: Constants.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: textColor
                          )
                      ),
                      labelText: 'Email',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) => email != null &&
                        !EmailValidator.validate(email) ? 'Enter a valid email' : null,
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: controller.elementAt(3),
                    textInputAction: TextInputAction.next,
                    maxLength: 20,
                    obscureText: true,
                    decoration: const InputDecoration(
                      fillColor: Constants.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: textColor
                        )
                      ),
                      labelText: 'Password',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? 'Enter min. 6 characters'
                        : null,
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            width: 160,
            height: 80,
            child: ElevatedButton.icon(
              onPressed: () {
                final userName = controller.elementAt(0);
                final name = controller.elementAt(1);
                final email = controller.elementAt(2);
                final pass = controller.elementAt(3);

               // if(formKey.currentState!.validate()) {
                  createUser(userName, name, email, pass, context);

               // }

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreeningBreakdown()),
                );
              },
              icon: const Icon(Icons.add, color: textColor),
              label: const Text(
                  'Sign Up',
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: textColor,
                  )
              ),
                style: ElevatedButton.styleFrom(
                    primary: buttonColor
                )
            ),
          ),
        ],
      ),
     ),
    );
  }
}