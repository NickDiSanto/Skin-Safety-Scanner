import 'package:flutter/material.dart';
import 'FurtherDetailsMelanoma.dart';
import 'RegisteredHomePage.dart';

class GeneratedReport extends StatefulWidget {
  final Map scan;
  // var _list = _scan.values.toList(); // <- Doesn't work
  
  const GeneratedReport({
        Key? key,
    required this.scan,
  }) : super(key: key);

  @override
  State<GeneratedReport> createState() => _GeneratedReportState();
}

class _GeneratedReportState extends State<GeneratedReport> {
  get mapList => widget.scan.entries.toList();
  //Above, I am declaring a variable named mapList which turns the Map (called scan) into a usable list

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String percentage = (mapList[0].value * 100).toStringAsFixed(2); // Melanoma percentage
    String condition = mapList[0].key; // Melanoma
    //(mapList[1].value * 100).toStringAsFixed(3) // Not_Melanoma Percentage (Ex: 92.783%)
    //mapList[1].key // "Not_Melanoma"

    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.cyan[600],
          automaticallyImplyLeading: false,
            actions: <Widget> [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisteredHomePage()),
                  );
                },
                child: const Text(
                    'Home',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ]
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
                child: const Text(
                    'Your image displayed',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34
                    )
                )
            ),
            //MELANOMA
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
                child: Text(
                    percentage + '%',
                    style: const TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 35
                    )
                )
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(35, 10, 35, 15),
                child: Text(
                  'similarity with images of positive cases of ' + condition + '.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                )
            ),

            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FurtherDetailsMelanoma()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.cyan[600]
                  ),
                  label: const Text(
                      'Next',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                  icon: const Icon(Icons.navigate_next),
                )
            )
          ],
        )
    );
  }
}


// OLD PDF GENERATOR CONTAINER
/*
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: ElevatedButton.icon(
                    onPressed: () {
                      //TEMPORARY CODE - REPLACE WITH REPORT GENERATION
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GeneratedReport()));
                      // END TEMPORARY CODE
                    },
                    label: const Text(
                        'Generate PDF',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        )
                    ), icon: const Icon(Icons.print)
                )
            ),
 */