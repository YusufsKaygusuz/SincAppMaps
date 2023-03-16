# From SincApp Maps
Hi there👋. I'm SincApp Software Manager. I would be happy to present a part of our SincApp Application with you. In the application, we made a multi-point(📍) display on the map. We share it so that you can integrate it into your applications.

<h3>Step By Step Roadmap</h3>

▶️ Step1) Create a project.

▶️ Step2) Add required package in pubspec.yaml

	          google_maps_flutter: ^2.1.1
  	          maps_launcher: ^2.0.1

you should visit to https://pub.dev/ address to examine.

▶️ Step3) Now read documents of google_maps_flutter plugin and do reuired things to work with google map in Android and IOS

▶️ Step4)❗❗❗ GET API KEY  https://console.cloud.google.com/  MUST flow all steps of google_maps_flutter documents
	1.at Google Developers Console. create new project
	2.select your created project
	3. click on navigation menu -> APIs & Services -> Credentials -> +CREATE  Credentials -> API Key -> now you can see Your API Key
	4. APIs & Services -> Enable APIs and services or API Library -> ENABLE BOTH ANDROID AND IOS SDK TO WORK WITH GOOGLE MAP IN YOU APP
	❗❗❗ This step is essential to work your application without problem

![image](https://user-images.githubusercontent.com/86704802/185737551-14694f86-1dc9-4537-a195-730d1c2ed904.png) <h4>After this step, your project is ready for flight. </h4>

▶️ Step5) NOW Add your API KEY in your project accourding to document of google_maps_flutter 
	
1 for android ->
	
			<manifest ...
 			<application ...
    			<meta-data android:name="com.google.android.geo.API_KEY"
              		android:value="YOUR KEY HERE"/>
	
2. Specify your API key in the application delegate ios/Runner/AppDelegate.swift:

			import UIKit
			import Flutter
			import GoogleMaps

			@UIApplicationMain
			@objc class AppDelegate: FlutterAppDelegate {
	  		override func application(
    			_ application: UIApplication,
	    		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  			) -> Bool {
   			 GMSServices.provideAPIKey("YOUR KEY HERE")
    			GeneratedPluginRegistrant.register(with: self)
    			return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  			}
			}
	
▶️ Step6)  MUST DO THIS ->  must check you ext.kotlin_version must be  1.6.0 or 1.6.10 inside android\build.gradle: 
			Set the minSdkVersion in android/app/build.gradle:
			
			android {
    			defaultConfig {
        		minSdkVersion 20
   	 		}
			}
			
and  STOP your project and rerun it and
	
▶️ Step7) Add screen to show multimarker mapmultimarker.dart

<h3>✴️Coding Part✴️</h3>
<h3>--------------------------</h3>

	import 'package:flutter/material.dart';

	import 'package:google_maps_flutter/google_maps_flutter.dart';

	class MapMultiMarker extends StatefulWidget {

  	const MapMultiMarker({Key? key}) : super(key: key);
  

  	@override
  
  	State<MapMultiMarker> createState() => _MapMultiMarkerState();
	
	}

	class _MapMultiMarkerState extends State<MapMultiMarker> {
	
  	final List<Map<String, dynamic>> clityList = const [
	
    	{
	
      "address": "SincApp_001",
	
      "id": "sincapp001",
	
      "image":
	
          "...",
	
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
          "...",
	
      "lat": 41.087000,
	
      "lng": 28.952001,
	
      "name": "Haliç Üniversitesi-Sincap002",
	
      "phone": "34060",
	
      "region": "European Side"
	
    }
	
  	];
	

  	final Map<String, Marker> _markers = {};

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

					   
 	 @override
					   
 	 Widget build(BuildContext context) {
					   
    	return GoogleMap(
					   
      onMapCreated: _onMapCreated,
					   
      initialCameraPosition: const CameraPosition(
					   
        target: LatLng(clityList[0]['lat'], clityList[0]['lng']),
					   
        zoom: 4.8,
					   
      ),
					   
      markers: _markers.values.toSet(),
					   
    	);
  	}
	}


▶️ Step8) Add this coding part to your application				   

  	launchMap(lat, long) 
		{
					   
   	 MapsLauncher.launchCoordinates(lat, long);
					   }

<h3 align="left">Connect with me:</h3>
<p align="left">
<a href="https://www.linkedin.com/in/yusuf-sami-kaygusuz-69b992230" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="yusuf-kaygusuz-69b992230" height="30" width="40" /></a>
<a href="https://instagram.com/yusufskaygusuz" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/instagram.svg" alt="yusufskaygusuz" height="30" width="40" /></a>
<a href="https://medium.com/@yusufskaygusuz" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/medium.svg" alt="@yusufskaygusuz" height="30" width="40" /></a>
</p>

