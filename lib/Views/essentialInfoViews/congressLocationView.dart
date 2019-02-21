import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:icms_bulgaria/Models/congressLocation.dart';
import 'package:icms_bulgaria/Views/contactUsView.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:platform/platform.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent/android_intent.dart';

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
  bool fullScreenMap = false;
  ScrollController listScrollCtrl = new ScrollController();
  CongressLocation selEntry = null;

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
          child: new Column(
            children: <Widget>[
              new AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                height: fullScreenMap ? 0 : 200,
                margin: EdgeInsets.only(top: fullScreenMap ? 10 : 20),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal:  10.0),
                child: FutureBuilder<List<CongressLocation>>(
                  future: fetchCongressLocations(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);

                    return snapshot.hasData
                        ? CongressLocationsList(locations: snapshot.data, parent: this)
                        : Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)));
                  },
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Card(
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        child: Stack(
                          children: <Widget>[
                            GoogleMap(
                              onMapCreated: _onMapCreated,
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(42.6978634, 23.3221789),
                                  zoom: 10
                              ),
                              mapType: MapType.normal,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: FloatingActionButton(
                                  onPressed: () => toggleFullScreen(),
                                  materialTapTargetSize: MaterialTapTargetSize.padded,
                                  backgroundColor: const Color(0xFF13909B),
                                  child: Icon(fullScreenMap ? Icons.fullscreen_exit : Icons.fullscreen, size: 36.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: selEntry != null ? FloatingActionButton(
                                  onPressed: () => openInGoogleMaps(),
                                  materialTapTargetSize: MaterialTapTargetSize.padded,
                                  backgroundColor: const Color(0xFF13909B),
                                  child: Icon(Icons.navigation, size: 36.0),
                                ) : null,
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset("assets/icons/iconlocationwhite.png"),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                    Text("Congress\nlocation", textAlign: TextAlign.center, style: TextStyle(height: 1.5, color: Colors.white, fontSize: 17),)
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
    mapController = controller;
  }

  void toggleFullScreen() {
    setState(() {
      fullScreenMap = !fullScreenMap;
    });
  }

  void openInGoogleMaps() async
  {
    if (new LocalPlatform().isAndroid) {
      String destination="${selEntry.lat},${selEntry.long}";
      final AndroidIntent intent = new AndroidIntent(
          action: 'action_view',
          data: Uri.encodeFull(
              "https://www.google.com/maps/dir/?api=1&destination=" + destination + "&travelmode=driving&dir_action=navigate"),
          package: 'com.google.android.apps.maps');
      intent.launch();
    }
    else {
      String googleUrl =
          'comgooglemaps://?center=${selEntry.lat},${selEntry.long}';
      String appleUrl =
          'https://maps.apple.com/?sll=${selEntry.lat},${selEntry.long}';
      if (await canLaunch("comgooglemaps://")) {
        print('launching com googleUrl');
        await launch(googleUrl);
      } else if (await canLaunch(appleUrl)) {
        print('launching apple url');
        await launch(appleUrl);
      } else {
        throw 'Could not launch url';
      }
    }
  }

  void _onTapItem(BuildContext context, CongressLocation loc, double idx) {
    mapController.clearMarkers();
    mapController.addMarker(MarkerOptions(
        position: LatLng(loc.lat, loc.long),
        infoWindowText: InfoWindowText(loc.title, ""),
        icon: BitmapDescriptor.fromAsset("assets/icons/iconlocationgradient.png")
    ));
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(loc.lat, loc.long),
      zoom: 15.0,
    )));

    setState(() {
      selEntry = loc;
    });

    double width = MediaQuery.of(context).size.width;
    listScrollCtrl.animateTo((180 * idx) - width/4, duration: new Duration(seconds: 2), curve: Curves.ease);
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
        scrollDirection: Axis.horizontal,
        itemCount: locations.length,
        controller: parent.listScrollCtrl,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => parent._onTapItem(context, locations[index], (index*1.0)),
            child: Card(
                color: (parent.selEntry != null && parent.selEntry.id == locations[index].id) ? const Color(0xFF26A368) : Colors.white,
                child: Container(
                  child: Center(
                    child: Text(locations[index].title, style: TextStyle(color: Colors.black, height: 2, fontSize: 15), textAlign: TextAlign.center),
                  ),
                  margin: EdgeInsets.all(5),
                  color: Colors.white,
                )
            ),
          );
        }
    );
  }

}