import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skin_safety_scanner/LogInScreen.dart';
import 'package:skin_safety_scanner/RegisteredHomePage.dart';

// class for the registered home page screen
class CreateAccount extends StatelessWidget {
  String Fname = "";
  String Lname = "";
  String email = "";
  String pass = "";

  CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Skin Safety Scanner"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
            child: const Text(
              "Create Account",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 34),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              maxLength: 20,
              onChanged: (text) {
                Fname = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
                hintText: 'Enter Your First Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              maxLength: 20,
              onChanged: (text) {
                Lname = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Last Name',
                hintText: 'Enter Your Last Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              maxLength: 25,
              //inputFormatters: [
              //  FilteringTextInputFormatter.allow(RegExp(r'^(.+)@(.+)$'))
              //  ],
              onChanged: (text) {
                email = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter Your Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              maxLength: 20,
              //obscureText: true,
              onChanged: (text) {
                pass = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter a Password',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 240,
            height: 90,
            child: ElevatedButton.icon(
              onPressed: () {
                // uploadingData(Fname, Lname, email, pass);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisteredHomePage()), // go back to homepage
                );
              },
              icon: const Icon(Icons.add),
              label: const Text("Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueGrey)),
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   width: 270,
          //   height: 90,
          //   child: ElevatedButton.icon(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const RegisteredHomePage()), // go homepage
          //       );
          //     },
          //     icon: const Icon(Icons.add),
          //     label: const Text("Skip to homepage(For testing navigation)",
          //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          //     style: ButtonStyle(
          //         backgroundColor:
          //         MaterialStateProperty.all<Color>(Colors.blueGrey)),
          //   ),
          // ),
        ],
      ),
    );
  }
}