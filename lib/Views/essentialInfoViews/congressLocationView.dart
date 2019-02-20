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

  GoogleMapController mapController;
  MapType _currentMapType = MapType.normal;

  final LatLng _center = const LatLng(45.521563, -122.677433);
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
          child: Stack(
              children: <Widget>[Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              new Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: FutureBuilder<List<CongressLocation>>(
                  future: fetchCongressLocations(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);

                    return snapshot.hasData
                        ? CongressLocationsList(locations: snapshot.data, parent: this)
                        : Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)));
                  },
                ),
              )

              ]
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

  void _onMapCreated(GoogleMapController controller) {

    controller.addMarker(MarkerOptions(
      position: controller.cameraPosition.target,
      visible: true,
      infoWindowText: InfoWindowText('Random Place', '5 Star Rating'),
      icon: BitmapDescriptor.defaultMarker,
    ));
  }
}

class CongressLocationsList extends StatelessWidget {
  final List<CongressLocation> locations;
  final _CongressLocationMenuState parent;

  CongressLocationsList({Key key, this.locations, this.parent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemCount: locations.length,
      itemBuilder: (context, index) {

        return Card(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              Center(
                child: ListTile(
                  onTap: () => _onTapItem(context, locations[index]),
                  title: new Row(
                    children: <Widget>[
                      new Expanded(child: Text(locations[index].title, style: TextStyle(color: Colors.black), textAlign: TextAlign.center))
                    ],
                  )
                )
              ),
              Container(
                child: Stack(
                  children: <Widget>[
                    GoogleMap(
                      onMapCreated: (GoogleMapController ctr)
                      {
                        ctr.addMarker(MarkerOptions(
                          position: LatLng(locations[0].lat, locations[0].long),
                          infoWindowText: InfoWindowText(locations[index].title, 'test'),
                          icon: BitmapDescriptor.defaultMarker,
                        ));
                      },
                      initialCameraPosition: CameraPosition(
                        target: LatLng(locations[0].lat, locations[0].long),
                        zoom: 16.0,
                      ),
                      trackCameraPosition: false,
                      scrollGesturesEnabled: false,
                      compassEnabled: false,
                      rotateGesturesEnabled: false,
                      tiltGesturesEnabled: false,
                      zoomGesturesEnabled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Column(
                          children: <Widget>[
                            FloatingActionButton(
                              //onPressed: _onMapTypeButtonPressed,
                              materialTapTargetSize: MaterialTapTargetSize.padded,
                              backgroundColor: Colors.green,
                              child: const Icon(Icons.map, size: 36.0),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

void _onTapItem(BuildContext context, CongressLocation entry) {

}