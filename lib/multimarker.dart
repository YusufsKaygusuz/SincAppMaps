import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class multiMarker extends StatefulWidget {
  const multiMarker({ Key? key }) : super(key: key);

  @override
  State<multiMarker> createState() => _multiMarkerState();
}

class _multiMarkerState extends State<multiMarker> {


final List<Map<String, dynamic>> clityList = const [
    {
      "address": "SincApp_001",
      "id": "sincapp001",
      "image":
          "https://www.halic.edu.tr/documents/lisansustu/kampus1.jpg",
      "lat": 41.087525,
      "lng": 28.951964,
      "name": "Haliç Üniversitesi-Sincap001",
      "postCode": "34060",
      "region": "European Side"
    },
    {
      "address": "SincApp_002",
      "id": "sincapp002",
      "image":
          "https://www.halic.edu.tr/documents/lisansustu/kampus1.jpg",
      "lat": 41.087000,
      "lng": 28.952001,
      "name": "Haliç Üniversitesi-Sincap002",
      "phone": "34060",
      "region": "European Side"
    },
    {
      "address": "SincApp_003",
      "id": "sincapp003",
      "image":
          "https://www.halic.edu.tr/documents/lisansustu/kampus1.jpg",
      "lat": 41.087143,
      "lng": 28.952001,
      "name": "Haliç Üniversitesi-Sincap003",
      "phone": "34060",
      "region": "European Side"
    },
    {
      "address": "SincApp_004",
      "id": "sincapp004",
      "image":
          "https://www.halic.edu.tr/documents/lisansustu/kampus1.jpg",
      "lat": 41.087873,
      "lng": 28.952064,
      "name": "Haliç Üniversitesi-Sincap004",
      "phone": "34060",
      "region": "European Side"
    },
    {
      "address": "SincApp_Center",
      "id": "sincapp005",
      "image":
          "https://avmdergi.com/wp-content/uploads/2016/03/marmara-forum.jpg",
      "lat": 40.996796,
      "lng": 28.887118,
      "name": "Marmara Forum-Sincapp005",
      "phone": "34100",
      "region": "European Side"
    },
    {
      "address": "SincApp_006",
      "id": "sincapp006",
      "image":
          "https://avmdergi.com/wp-content/uploads/2016/03/marmara-forum.jpg",
      "lat": 40.651905,
      "lng": 29.218826,
      "name": "Yalova Üniversitesi-Sincapp006",
      "phone": "77200",
      "region": "European Side"
    },
    {
      "address": "SincApp_007",
      "id": "sincapp007",
      "image":
          "https://avmdergi.com/wp-content/uploads/2016/03/marmara-forum.jpg",
      "lat": 40.654135,
      "lng": 29.221036,
      "name": "Yalova Üniversitesi-Sincapp007",
      "phone": "77200",
      "region": "European Side"
    },
    {
      "address": "SincApp_008",
      "id": "sincapp008",
      "image":
          "https://avmdergi.com/wp-content/uploads/2016/03/marmara-forum.jpg",
      "lat": 40.652106,
      "lng": 29.219171,
      "name": "Yalova Üniversitesi-Sincapp008",
      "phone": "77200",
      "region": "European Side"
    },
    
  ];

  final Map<String, Marker> _markers ={};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _markers.clear();
    setState(() {
      for (int i = 0; i < clityList.length; i++) {
        print("For Loop");
        final marker = Marker(
          markerId: MarkerId(clityList[i]['name']),
          position: LatLng(clityList[i]['lat'], clityList[i]['lng']),
          infoWindow: InfoWindow(
              title: clityList[i]['name'],
              snippet: clityList[i]['address'],
              onTap: () {
                print("${clityList[i]['lat']}, ${clityList[i]['lng']}");
                launchMap(clityList[i]['lat'], clityList[i]['lng']);
              }),
          onTap: () {
            print("Clicked on marker");
          },
        );
        print("${clityList[i]['lat']}, ${clityList[i]['lng']}");
        _markers[clityList[i]['name']] = marker;
      }
    });
  }

  launchMap(lat, long) {
    MapsLauncher.launchCoordinates(lat, long);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition:  CameraPosition(
        target: LatLng(clityList[0]['lat'], clityList[0]['lng']),
        zoom: 12,
      ),
      markers: _markers.values.toSet(),
    );
  }
}