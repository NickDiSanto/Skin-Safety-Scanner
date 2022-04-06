import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// API KEY: AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y
// ^ Works for both Places and Geocoding

// In Safari, the below returns locations we need
// Places
// https://maps.googleapis.com/maps/api/place/textsearch/json?query=dermatologists&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y
// https://maps.googleapis.com/maps/api/place/textsearch/json?query=dermatologists&location=33.9289%2C117.4259&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y
// ^The second URL uses the location of CBU as an argument
// CBU Lat/Long: 33.9289° N, 117.4259° W


// Full Json Response from Places
class SearchResults {
  final List results;

  const SearchResults({required this.results});

  factory SearchResults.fromJson(Map<String, dynamic> json) {
    return SearchResults(
      results: json['results'], //This handles the complex JSON part
    );
  }
}



class NearbyDermatologists extends StatefulWidget {
  final double lat;
  final double long;

  const NearbyDermatologists({
    Key? key,
    required this.lat,
    required this.long
  }) : super(key: key);



  @override
  _NearbyDermatologistsState createState() => _NearbyDermatologistsState();
}

class _NearbyDermatologistsState extends State<NearbyDermatologists> {
  late Future<SearchResults> futureSearchResults;

  //Fetches the data
  @override
  void initState() {
    super.initState();
    futureSearchResults = fetchSearchResults(widget.lat, widget.long);
  }


  Future<SearchResults> fetchSearchResults(double lat, double long) async {
    String latString = lat.toString();
    String longString = long.toString();

    String createdURL = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=dermatologists&location=' + latString + '%2C' + longString + '&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y';
    // String url = 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=dermatologists&location=33.9289%2C117.4259&key=AIzaSyBOywn96D8KYek0-xghDDDGB7rF1rrMn8Y';
    final response = await http.get(Uri.parse(
        createdURL));

    if (response.statusCode == 200) {
      //Change Data into List of Result
      return SearchResults.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to complete get request');
    }
  }

  // Builds user interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
            child: FutureBuilder<SearchResults>(
                future: futureSearchResults,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //NEED TO BREAK UP LOOP. CRAP
                    return ListView.builder(
                        itemCount: snapshot.data!.results.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              child: Text(
                                  snapshot.data!.results[index]['name'] + '\n\n'
                                      + snapshot.data!.results[index]['formatted_address'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 25
                                  )
                              ));
                        }
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                })));
  }
}

/*
 IT WORKS!!! Doctors show without hardcoding!
 class _NearbyDermatologistsState extends State<NearbyDermatologists> {
   late Future<SearchResults> futureSearchResults;

   //Fetches the data
   @override
   void initState() {
     super.initState();
     futureSearchResults = fetchSearchResults();
   }

   List list = [
     'PACIFIC DERMATOLOGY INSTITUTE',
     'Dr. Vincent Fowler',
     'Meyering D Steven MD'
   ];

   // Builds user interface
   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           title: const Text('Skin Safety Scanner'),
           centerTitle: true,
           backgroundColor: Colors.blueAccent,
         ),
         body: Center(
             child: FutureBuilder<SearchResults>(
                 future: futureSearchResults,
                 builder: (context, snapshot) {
                   if (snapshot.hasData) {
                     //NEED TO BREAK UP LOOP. CRAP
                     return ListView.builder(
                       itemCount: snapshot.data!.results.length,
                       itemBuilder: (BuildContext context, int index) {
                         return Card(
                             child: Text(
                               snapshot.data!.results[index]['name'],
                             ));
                       }
                     );
                   } else if (snapshot.hasError) {
                     return Text('${snapshot.error}');
                   }

                   return const CircularProgressIndicator();
                 })));
   }
 }

  */

/*
 GOT A DOCTOR TO SHOW UP!!!!
 class _NearbyDermatologistsState extends State<NearbyDermatologists> {
   late Future<SearchResults> futureSearchResults;

   //Fetches the data
   @override
   void initState() {
     super.initState();
     futureSearchResults = fetchSearchResults();
   }

   List list = [
     'PACIFIC DERMATOLOGY INSTITUTE',
     'Dr. Vincent Fowler',
     'Meyering D Steven MD'
   ];

   // Builds user interface
   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           title: const Text('Skin Safety Scanner'),
           centerTitle: true,
           backgroundColor: Colors.blueAccent,
         ),
         body: Center(
             child: FutureBuilder<SearchResults>(
                 future: futureSearchResults,
                 builder: (context, snapshot) {
                   if (snapshot.hasData) {
                     //NEED TO BREAK UP LOOP. CRAP
                     return Text(snapshot.data!.results[19]['name']);
                   } else if (snapshot.hasError) {
                     return Text('${snapshot.error}');
                   }

                   return const CircularProgressIndicator();
                 })));
   }
 }

  */