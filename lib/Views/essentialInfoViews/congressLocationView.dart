import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:icms_bulgaria/Models/congressLocation.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<List<CongressLocation>> fetchCongressLocations() async {
  final response = await http.get('https://icmsbg.org/icms-mobile/congress-locations.php');

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<CongressLocation>((json) => CongressLocation.fromJson(json)).toList();
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load speakers');
  }
}

class CongressLocationMenu extends StatefulWidget {
  @override
  _CongressLocationMenuState createState() => _CongressLocationMenuState();
}

class _CongressLocationMenuState extends State<CongressLocationMenu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/bluebg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: new Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: FutureBuilder<List<CongressLocation>>(
              future: fetchCongressLocations(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);

                return snapshot.hasData
                    ? CongressLocationsList(locations: snapshot.data)
                    : Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),));
              },
            ),
          ),
        ),
        bottomNavigationBar:  new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/footer.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: new BottomAppBar(
            color: Colors.transparent,
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 40,
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: Image.asset("assets/icons/iconmail.png"),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUsMenu()),
                    );
                  },
                )
              ],
            ),
          ),
        )

    );
  }
}

class CongressLocationsList extends StatelessWidget {
  final List<CongressLocation> locations;

  CongressLocationsList({Key key, this.locations}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return new Card(
              child:Column(
                children: <Widget>[
                  Container(
                      child: Text(locations[index].title, style: TextStyle(color: Colors.black, height: 2, fontSize: 15), textAlign: TextAlign.center),padding: EdgeInsets.symmetric(vertical: 20)
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 200,
                    child: Stack(
                      children: <Widget>[
                        GoogleMap(
                          onMapCreated: (GoogleMapController ctr)
                          {
                            ctr.addMarker(MarkerOptions(
                                position: LatLng(locations[index].lat, locations[index].long),
                                icon: BitmapDescriptor.defaultMarker,
                                consumeTapEvents: true,

                            ));
                          },
                          initialCameraPosition: CameraPosition(
                            target: LatLng(locations[index].lat, locations[index].long),
                            zoom: 15.0,
                          ),
                          mapType: MapType.normal,
                        )
                      ],
                    ),
                  )
                ],
              )
          );
        }
    );
  }

}