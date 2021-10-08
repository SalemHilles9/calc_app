import 'package:age/age.dart' ;
import 'package:calcu_app/logic/age_calculation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime todayDate = DateTime.now();
  DateTime dob = DateTime(1999,2,1);
  late AgeDuration _ageDuration;
  late AgeDuration _nextBirthdate;
  late int _nextbdayWeekDay;
  List<String> _monthes = [
    "monthes",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List<String> _weeks = [
    "weeks",
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATARDAY",
    "SUNDAY"
  ];


  Future<Null> _selectTodayDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: dob,
        lastDate: DateTime(2101)
    );
    if(picked!=null && picked!=todayDate){
      setState(() {
        todayDate = picked;
        _ageDuration = AgeCalculation().calculateAge(todayDate, dob);
        _nextBirthdate = AgeCalculation().nextBirthday(todayDate, dob);
        _nextbdayWeekDay = AgeCalculation().nextbday(todayDate, dob);
      });
    }
  }
  Future<Null> _selectDOBDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dob,
        firstDate: DateTime(1900),
        lastDate: todayDate
    );
    if(picked!=null && picked!=dob){
      setState(() {
        dob = picked;
        _ageDuration = AgeCalculation().calculateAge(todayDate, dob);
        _nextBirthdate = AgeCalculation().nextBirthday(todayDate, dob);
        _nextbdayWeekDay = AgeCalculation().nextbday(todayDate, dob);
      });
    }
  }

  @override
  void initState(){
    super.initState();
    _ageDuration = AgeCalculation().calculateAge(todayDate, dob);
    _nextBirthdate = AgeCalculation().nextBirthday(todayDate, dob);
    _nextbdayWeekDay = AgeCalculation().nextbday(todayDate, dob);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text(
              'AGE CALCULATOR',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'NotoSerif',
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 10,bottom: 5,end: 10,),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: 'NotoSerif',
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${todayDate.day} ${_monthes[todayDate.month]} ${todayDate.year}',
                                style: TextStyle(
                                    color: Colors.blue.shade400,
                                    fontSize: 20,
                                    fontFamily: 'NotoSerif',
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: (){
                                  _selectTodayDate(context);
                                },
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Date of Birth',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'NotoSerif',
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${dob.day} ${_monthes[dob.month]} ${dob.year}',
                                  style: TextStyle(
                                      color: Colors.blue.shade400,
                                      fontSize: 20,
                                      fontFamily: 'NotoSerif',
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    _selectDOBDate(context);
                                  },
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                     Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 40
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff333333),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 200,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'AGE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: 'NotoSerif',
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '${_ageDuration.years}',
                                              style: TextStyle(
                                                  color: Colors.blue.shade400,
                                                  fontSize: 76,
                                                  fontFamily: 'NotoSerif',
                                                  fontWeight: FontWeight.w700
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 13),
                                              child: Text(
                                                'YEARS',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontFamily: 'NotoSerif',
                                                    fontWeight: FontWeight.w700
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Text(
                                        //   '${_ageDuration.months} months | ${_ageDuration.days} days',
                                        //   style: TextStyle(
                                        //       color: Colors.white,
                                        //       fontSize: 20,
                                        //       fontWeight: FontWeight.w400
                                        //   ),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 3,right: 3),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${_ageDuration.months} months',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: 'NotoSerif',
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Text(
                                                  '|',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontFamily: 'NotoSerif',
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '${_ageDuration.days} days',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: 'NotoSerif',
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 170,
                                    width: 1,
                                    color: Color(0xff999999),
                                  ),
                                  Container(
                                    height: 200,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'NEXT BIRTHDAY',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'NotoSerif',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                        Icon(
                                          Icons.cake,
                                          color: Colors.blue.shade400,
                                          size: 40,
                                        ),
                                        Text(
                                          '${_weeks[_nextbdayWeekDay]}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontFamily: 'NotoSerif',
                                              fontWeight: FontWeight.w700
                                          ),
                                        ),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 3,right: 3),
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             children: [
                                           Text(
                                               '${_nextBirthdate.months} months',
                                               style: TextStyle(
                                                   color: Colors.white,
                                                   fontSize: 20,
                                                   fontFamily: 'NotoSerif',
                                                   fontWeight: FontWeight.w400
                                               ),
                                             ),
                                               Padding(
                                                 padding: const EdgeInsets.all(3.0),
                                                 child: Text(
                                                   '|',
                                                   style: TextStyle(
                                                       color: Colors.white,
                                                       fontFamily: 'NotoSerif',
                                                       fontSize: 18,
                                                       fontWeight: FontWeight.w400
                                                   ),
                                                 ),
                                               ),
                                           Text(
                                             '${_nextBirthdate.days} days',
                                             style: TextStyle(
                                                 color: Colors.white,
                                                 fontFamily: 'NotoSerif',
                                                 fontSize: 20,
                                                 fontWeight: FontWeight.w400
                                             ),
                                           ),
                                             ],
                                           ),
                                         )
                                        //  Text(
                                        //    '${_nextBirthdate.months} months | ${_nextBirthdate.days} days',
                                        //    style: TextStyle(
                                        //        color: Colors.white,
                                        //        fontSize: 20,
                                        //        fontWeight: FontWeight.w400
                                        //    ),
                                        //  ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 1,
                                width: double.maxFinite,
                                color: Color(0xff999999),
                                margin: EdgeInsets.symmetric(horizontal: 15),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20
                                ),
                                child: Text(
                                  'SUMMARY',
                                  style: TextStyle(
                                      color: Colors.blue.shade400,
                                      fontSize: 18,
                                      fontFamily: 'NotoSerif',
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 35
                                ),
                                child: Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'YEARS',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'NotoSerif',
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${_ageDuration.years}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'NotoSerif',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'MONTHS',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'NotoSerif',
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${((_ageDuration.years)*12)+(_ageDuration.months)}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'NotoSerif',
                                              fontWeight: FontWeight.w400
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'WEEKS',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'NotoSerif',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${(todayDate.difference(dob).inDays/7).floor()}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'NotoSerif',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400
                                          ),
                                        )
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 35
                                ),
                                child: Row(
                                  mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'DAYS',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'NotoSerif',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${todayDate.difference(dob).inDays}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'NotoSerif',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'HOURS',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'NotoSerif',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${todayDate.difference(dob).inHours}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: 'NotoSerif',
                                              fontWeight: FontWeight.w400
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'MINUTES',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: 'NotoSerif',
                                              fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${todayDate.difference(dob).inMinutes}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'NotoSerif',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          )
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
