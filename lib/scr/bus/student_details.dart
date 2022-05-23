import 'package:flutter/material.dart';
import 'package:scostudent/data/model/response_model/students/students_list.dart';
import 'package:scostudent/data/api/error_data.dart';
import 'package:scostudent/lang/AppLocalizations.dart';
import 'package:scostudent/scr/bus/student_sup_details.dart';
import 'package:scostudent/scr/widgets/section_card.dart';
import '../../app_constants.dart';
import '../../app_utiles/sizes.dart';
import '../../presenter/bus_Students/bus_student_presenter.dart';
import '../../presenter/bus_Students/bus_student_presenter_interface.dart';
import '../view_interfaces/student_bus_view_interface.dart';
import '../widgets/center_progress_bar.dart';

class StudentDetails extends StatefulWidget {
  @override
  _StudentDetails createState() => _StudentDetails();
}

class _StudentDetails extends State<StudentDetails>
    implements BusStudentsViewInterface {
  BusStudents? _busStudents;
  bool _progressVisability = true;
  AppLocalizations? localizations;

  BusStudentsPresenterInterface? _busStudentsPresenterInterface;
  _StudentDetails() {
    _busStudentsPresenterInterface = BusStudentsPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _busStudentsPresenterInterface!.busStudents();
  }
@override
  void didChangeDependencies() {
    localizations = AppLocalizations.of(context)!;
    super.didChangeDependencies();
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
                      width: SizeConfig.width(context: context, pixels: 100),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 16),
                        child:  Text(
                           localizations!.translate(schoolBus)
                        ,
                          style: const TextStyle(
                            color: Colors.white,
                              fontFamily: fontTextmedium, fontSize: 20),
                        ))
                  ],
                
              ))),
      body: 
       Padding(padding: EdgeInsets.only(top:SizeConfig.height(context: context, pixels: 20),)
       ,child: SizedBox(

                  
                          height:MediaQuery.of(context).size.height,
                          
                          child
:      SectionCard(
        child: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.height(context: context, pixels: 25),
             
              bottom: SizeConfig.height(context: context, pixels: 16)),
          child: _progressVisability == true
              ? CenterCircularProgressbar(
                  submitProgressVisbility: _progressVisability)
              : 
               SingleChildScrollView(
                        child: 
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              
                  Container(

                  
                            decoration:  BoxDecoration(
                              color: Colors.white,
                                 borderRadius: BorderRadius.circular(25),
                            ),
                        
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  color: borderColor,
                                  thickness: 1,
                                );
                              },
                              //show only five element
                              itemCount:_busStudents == null? 0 : _busStudents!.data!.length,
                              itemBuilder: (context, index) {
                                return 
                                Padding(padding: EdgeInsets.only( left: SizeConfig.width(context: context, pixels: 25),
              right: SizeConfig.width(context: context, pixels: 25),),child:
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (_, __, ___) => StudentSupDetails(
                                                  studentdetailsName: AppLocalizations
                                                              .instance!
                                                              .locale
                                                              .languageCode ==
                                                          englishLanguageCode
                                                      ? "${_busStudents!.data![index].firstNameEn} ${_busStudents!.data![index].middleNameEn} ${_busStudents!.data![index].lastNameEn}"
                                                      : "${_busStudents!.data![index].firstNameAr} ${_busStudents!.data![index].middleNameAr} ${_busStudents!.data![index].lastNameAr}",
                                                  studentdetailsClass:
                                                      "${localizations!.translate(busNo)} ${_busStudents!.data![index].bus!.number}",
                                                  station: "soon",
                                                  matronName: AppLocalizations
                                                              .instance!
                                                              .locale
                                                              .languageCode ==
                                                          englishLanguageCode
                                                      ? "${_busStudents!.data![index].bus!.matron!.firstNameEn} ${_busStudents!.data![index].bus!.matron!.lastNameEn}"
                                                      : "${_busStudents!.data![index].bus!.matron!.firstNameAr} ${_busStudents!.data![index].bus!.matron!.lastNameAr}",
                                                  matronNumber:
                                                      "${_busStudents!.data![index].bus!.matron!.mobile}",
                                                  driverName: AppLocalizations
                                                              .instance!
                                                              .locale
                                                              .languageCode ==
                                                          englishLanguageCode
                                                      ? "${_busStudents!.data![index].bus!.driver!.firstNameEn} ${_busStudents!.data![index].bus!.driver!.lastNameEn}"
                                                      : "${_busStudents!.data![index].bus!.driver!.firstNameAr} ${_busStudents!.data![index].bus!.driver!.lastNameAr}",
                                                  driverNumber:
                                                      "${_busStudents!.data![index].bus!.driver!.mobile}",
                                                  busId: _busStudents!.data![index].bus!.id),
                                              transitionsBuilder: (_, anim, __, child) => Container(child: child),
                                              transitionDuration: const Duration(seconds: 1)));
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                            
                                              Image.asset(
                                                  "assets/images/student_image.png",width: 75,height: 81,),
                                              const SizedBox(width: 14),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(padding: EdgeInsets.only(left: 5,right:5),child:
                                                  Text(
                                                      AppLocalizations
                                                                  .instance!
                                                                  .locale
                                                                  .languageCode ==
                                                              englishLanguageCode
                                                          ? "${_busStudents!.data![index].firstNameEn} ${_busStudents!.data![index].middleNameEn} ${_busStudents!.data![index].lastNameEn}"
                                                          : "${_busStudents!.data![index].firstNameAr} ${_busStudents!.data![index].middleNameAr} ${_busStudents!.data![index].lastNameAr}",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontFamily:
                                                              fontTextmedium,
                                                          color: detailsColor))),
                                                          SizedBox(height:SizeConfig.height(context: context, pixels: 10) ,),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                         localizations!.translate(busNo) +  "${_busStudents!.data![index].bus!.number}",
                                                       style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: fontTextRegular,
                                                    color: secondDetailsColor)
                                                        
                                                        ,
                                                      ),
                                                      SizedBox(width: SizeConfig.width(context: context, pixels: 20) ,),
                                                      Text(
                                                        
                                                        "${localizations!.translate(station)}:  soon",
                                                        style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: fontTextRegular,
                                                    color: secondDetailsColor)
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ]),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Spacer(),
                                               Text(
                                                localizations!.translate(viewDetails)
                                               ,
                                                 style: const TextStyle(
                                                          fontSize: 13,
                                                          fontFamily:
                                                              fontTextmedium,
                                                          color: greenColor)
                                              ),
                                              SizedBox(
                                                width: SizeConfig.width(
                                                    context: context,
                                                    pixels: 10),
                                              ),
                                              Container(
                                                  width: SizeConfig.width(
                                                      context: context,
                                                      pixels: 21),
                                                  height: SizeConfig.height(
                                                      context: context,
                                                      pixels: 21),
                                                  decoration: BoxDecoration(
                                                      // color: greenColor,

                                                      border: Border.all(
                                                          color: greenColor,
                                                          width: 2),
                                                      shape: BoxShape.circle),
                                                  child: const Center(
                                                      child: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: greenColor,
                                                          size: 15)))
                                            ]

                         
                                            ),
                                      ],
                                    )));
                              },
                            )),
                  ],
                )),
        ),
      ))),
    );
  }

  @override
  void onLoadBusStudentsComplete(BusStudents busStudentsResponse) {
    final BusStudents busStudents = busStudentsResponse;

    if (mounted) {
      setState(() {
        _busStudents = busStudents;
        _progressVisability = false;
      });
    }
  }

  @override
  void onLoadBusStudentsError(ErrorResponse errorResponse) {
    
  if (mounted) {
      setState(() {
        _progressVisability = false;

        showAlertDialog(context, errorResponse.message);
      });
    }

  }
    showAlertDialog(BuildContext context, String errorMessage) {
    Widget okButton = TextButton(
      child: Text(
        localizations!.translate(AGREE),
    
      ),
      onPressed: () => Navigator.pop(context),
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        localizations!.translate(ATTENSION),
      ),
      content: Text(
        errorMessage,
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
