import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scostudent/data/model/response_model/received_location/recieved_location.dart';
import 'package:scostudent/data/api/error_data.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app_constants.dart';
import '../../app_utiles/sizes.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

import '../../lang/AppLocalizations.dart';
import '../../presenter/recieved_locations/location_presenter.dart';
import '../../presenter/recieved_locations/location_presenter_interface.dart';
import '../view_interfaces/ReceiveLocation_view_interface.dart';
import '../widgets/section_card.dart';
import '../widgets/section_cart_shap.dart';

class StudentSupDetails extends StatefulWidget {
  final String studentdetailsName;
  final String studentdetailsClass;
  final String station;
  final String matronName;

  final String matronNumber;
  final String driverName;
  final String driverNumber;
  final int? busId;

  const StudentSupDetails(
      {Key? key,
      required this.studentdetailsName,
      required this.studentdetailsClass,
      required this.station,
      required this.matronName,
      required this.matronNumber,
      required this.driverName,
      required this.driverNumber,
      required this.busId})
      : super(key: key);

  @override
  _StudentSupDetailsState createState() => _StudentSupDetailsState();
}

class _StudentSupDetailsState extends State<StudentSupDetails>
    implements ReceiveLocationViewInterface {
  double latitudeGet = 30.13414;
  double longitudeGet = 30.13414;
  AppLocalizations? localizations;

  StreamSubscription? _locationSubscription;
  final Location _locationTracker = Location();
  Marker? marker;
  Circle? circle;
  GoogleMapController? _controller;

  static CameraPosition initialLocation = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/images/car_icon.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(latitudeGet, longitudeGet);
    setState(() {
      marker = Marker(
          markerId: const MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading!,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: const Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: const CircleId("car"),
          radius: newLocalData.accuracy!,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  ReceiveLocation? _receiveLocation;

  ReceiveLocationPresenterInterface? _receiveLocationPresenterInterface;
  _StudentSupDetailsState() {
    _receiveLocationPresenterInterface = ReceiveLocationPresenter(this);
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription!.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged.listen((newLocalData) {
        _receiveLocationPresenterInterface!.receiveLocation(widget.busId);
        print("$latitudeGet vvvvvvvvvvvvvvvvv");
        _controller!.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                bearing: 31.9892824,
                target: LatLng(latitudeGet, longitudeGet),
                tilt: 0,
                zoom: 17.00)));
        updateMarkerAndCircle(newLocalData, imageData);
        // }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  late Timer timer;
  bool showGoogleMap = false;
  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }
@override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homePageColor,
      appBar: AppBar(
          backgroundColor: homePageColor,
             elevation: 0,
          automaticallyImplyLeading: false,
          title: Container(
              margin: const EdgeInsets.only(right: 15.0),
              child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(
                      width: SizeConfig.width(context: context, pixels: 50),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          widget.studentdetailsName,
                              style: const TextStyle(
                            color: Colors.white,
                              fontFamily: fontTextmedium, fontSize: 20)
                        ))
                  ],
                
              ))),
      body: 
      
       Padding(padding: EdgeInsets.only(top:SizeConfig.height(context: context, pixels: 20),)
       ,child: SizedBox(

                  
                          height:MediaQuery.of(context).size.height,
                          
                          child:
      SectionCard(
        child: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.height(context: context, pixels: 12),
              left: SizeConfig.width(context: context, pixels: 16),
              right: SizeConfig.width(context: context, pixels: 16),
              bottom: SizeConfig.height(context: context, pixels: 16)),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  child: SingleChildScrollView(
                      child: Column(children: [
                _kycForm(widget.studentdetailsName, widget.studentdetailsClass),
                if (showGoogleMap == true) _googleMap(),
              ])))
            ],
          )),
        ),
      ))),
    );
  }

  Widget _kycForm(
    String name,
    String classAge,
  ) {
    return SectionShapCard(
            child: Column(
          children: [
            Row(
              children: [
                SizedBox(width:  SizeConfig.width(context: context, pixels: 5),),
              Padding(padding: EdgeInsets.only(bottom: SizeConfig.height(context: context, pixels: 15)),child:  Image.asset("assets/images/student_image.png")),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          SizeConfig.width(context: context, pixels: 15),
                      vertical: SizeConfig.height(context: context, pixels: 12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name,
                             style: const TextStyle(
                                                          fontSize: 16,
                                                          fontFamily:
                                                              fontTextmedium,
                                                          color: detailsColor)),
                         SizedBox(height: SizeConfig.height(context: context, pixels: 10)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              classAge,
                               style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: fontTextRegular,
                                                    color: secondDetailsColor)
                            ),
                            SizedBox(width: SizeConfig.width(context: context, pixels: 15),),
                            Expanded(
                                child: Text(
                              "${localizations!.translate(station)}: ${widget.station}",
                               style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: fontTextRegular,
                                                    color: secondDetailsColor)
                            )),
                             SizedBox(
                              width: SizeConfig.width(context: context, pixels: 40),
                            )
                          ],
                        ),
                          SizedBox(
                              height: SizeConfig.height(context: context, pixels: 5),
                            ),
                        const Divider(color: borderColor,),

                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: 
             AppLocalizations.instance!.locale.languageCode ==
                                          englishLanguageCode?
            EdgeInsets.only(left:SizeConfig.width(context: context, pixels: 90),
            
            ):
             EdgeInsets.only(right:SizeConfig.width(context: context, pixels: 90),
            
            )
            
            ,child:
            Row(children: [
            
              
 Text(localizations!.translate(contactInfo)
                         ,
                          style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: fontTextRegular,
                                                    color: supDetailsColor)
                        ),
            ],)),
                       
                        SizedBox(
                          height:
                              SizeConfig.height(context: context, pixels: 8),
                        ),


                              Padding(padding: 
             AppLocalizations.instance!.locale.languageCode ==
                                          englishLanguageCode?
            EdgeInsets.only(left:SizeConfig.width(context: context, pixels: 90),
            
            ):
             EdgeInsets.only(right:SizeConfig.width(context: context, pixels: 90),
            
            )
            
            ,child:
           
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${localizations!.translate(matron)}: ${widget.matronName}",
                              style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: fontTextRegular,
                                                    color: secondDetailsColor)
                            ),
                            Padding(padding: EdgeInsets.only(left:  SizeConfig.width(context: context, pixels: 10),right:  SizeConfig.width(context: context, pixels: 10)),child:
                            InkWell(
                                onTap: () =>
                                    launch('tel:${widget.matronNumber}'),
                                child:
                                    Image.asset("assets/images/telephone.png"))),
                          ],
                        )),
                        SizedBox(
                          height:
                              SizeConfig.height(context: context, pixels: 3),
                        ),
                              Padding(padding: 
             AppLocalizations.instance!.locale.languageCode ==
                                          englishLanguageCode?
            EdgeInsets.only(left:SizeConfig.width(context: context, pixels: 90),
            
            ):
             EdgeInsets.only(right:SizeConfig.width(context: context, pixels: 90),
            
            )
            
            ,child:
       
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${localizations!.translate(driver)}: ${widget.driverName}",
                             style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: fontTextRegular,
                                                    color: secondDetailsColor)
                            ),
                              Padding(padding: EdgeInsets.only(left: SizeConfig.width(context: context, pixels: 10),right: SizeConfig.width(context: context, pixels: 10)),child:
                            InkWell(
                                onTap: () =>
                                    launch('tel:${widget.driverNumber}'),
                                child:
                                    Image.asset("assets/images/telephone.png"))),
                          ],
                        )),
                                        SizedBox(height:  SizeConfig.width(context: context, pixels: 15),),

            Container(
                width: MediaQuery.of(context).size.width - 200,
                height: 40,
                decoration: BoxDecoration(
                  color: greenColor,
                  border: Border.all(color: wordsColor, width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child:  Center(
                    child: Text(
                         localizations!.translate(willNotGoToSchoolToday )
                  ,
                  style: const TextStyle(
                      fontFamily: fontTextmedium,
                      fontSize: 13,
                      color: Colors.white),
                ))),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    showGoogleMap = true;
                  });
                  timer = Timer(const Duration(seconds: 5), () {
                    getCurrentLocation();
                  });
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: wordsColor,
                      border: Border.all(color: wordsColor, width: 1),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0)),
                    ),
                    child:  Center(
                        child: Text(
                             localizations!.translate(findBusOnMap)
                      ,
                      style: const TextStyle(
                      fontFamily: fontTextRegular,
                      fontSize: 18,
                      color: Colors.white),
                    ))))
          ],
        ));
  }

  Widget _googleMap() {
    return SizedBox(
        height: 500,
        width: MediaQuery.of(context).size.width - 20,
        child: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: initialLocation,
          myLocationEnabled: true,
          tiltGesturesEnabled: true,
          compassEnabled: true,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          markers: Set.of((marker != null) ? [marker!] : []),
          circles: Set.of((circle != null) ? [circle!] : []),
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
        ));
  }

  @override
  void onLoadReceiveLocationComplete(ReceiveLocation receiveLocationResponse) {
    print("successsssssssssssss");
    final ReceiveLocation receiveLocation = receiveLocationResponse;

    if (mounted) {
      setState(() {
        _receiveLocation = receiveLocation;
        latitudeGet = double.parse(receiveLocation.data!.lat!);
        longitudeGet = double.parse(receiveLocation.data!.lng!);
        timer.isActive;
      });
    }
  }

  @override
  void onLoadReceiveLocationError(ErrorResponse errorResponse) {
    print("${errorResponse.message}errororrrrrrrr");
  }
}
