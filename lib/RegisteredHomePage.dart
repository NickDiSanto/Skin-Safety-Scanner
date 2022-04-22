import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/PhotoSubmission.dart';
import 'package:ss_skin_project/ScreeningBreakdown.dart';
import 'LogHistory.dart';

// FIXME: Renderflex overflow error, "use Expanded widget"?

// class for the registered home page screen
class RegisteredHomePage extends StatelessWidget {
  static late UserCredential user;

  const RegisteredHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.cyan[600],
          automaticallyImplyLeading: false
        ),
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Welcome Home!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.cyan[600] as Color,
                  width: 3
                )
              ),
              child:
              Image.asset('assets/images/registered_homepage.jpg')
            ),
           // Image.asset('assets/images/registered_homepage.jpg'),
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScreeningBreakdown()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan[600]
                ),
                icon: const Icon(Icons.navigate_next),
                label: const Text(
                    'Start Scanning',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LogHistory()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan[600]
                ),
                icon: const Icon(Icons.navigate_next),
                label: const Text(
                    'See Past Scans',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ),
          ],
        )
    );
  }
}