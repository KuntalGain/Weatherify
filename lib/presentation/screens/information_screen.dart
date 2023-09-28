import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherify/constants/theme.dart';
import 'package:weatherify/presentation/screens/home_screen.dart';
// ignore: must_be_immutable
class InformationScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var weatherDataHourly;

 

 
    InformationScreen({
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppTheme.sunnyColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        // ignore: prefer_const_constructors
        title: Text("Location"),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          // ignore: prefer_const_constructors
          Padding(padding: EdgeInsets.only(right: 8.0),
          child: IconButton(
          onPressed: () {
            // ignore: prefer_const_constructors
            Get.to(HomeScreen());
          },
          icon: const Icon(Icons.settings)),)
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned( 
            top: 10,
            left: 10,
            child: SizedBox(height: 160, width: 90,
           child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 12,
              itemBuilder: (BuildContext context,int  index) {
                return  Obx((() => GestureDetector(
                  onTap: (){
                    
                  },
                  child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(offset: Offset(0.5, 0),
                      blurRadius: 30,
                      spreadRadius: 1,
                      color: Color(0x4cffffff),)
                    ],
                  ),
                  child: Hourlydetails(
                    index: index,
                    cardIndex: 2,
                    temp: weatherDataHourly[index].temp!,
                    timestamp: weatherDataHourly[index].dt!,
                    weathericon: weatherDataHourly[index].icon!,),
                ))));
              },) ))
      ]),
      );
  }
}

// ignore: must_be_immutable, non_constant_identifier_names
class Hourlydetails  extends StatelessWidget {
int temp;
 int timestamp;
 int index;
 int cardIndex;
 String weathericon; 

 String getTime(final timestamp) {
    DateTime time =  DateTime.fromMillisecondsSinceEpoch(timestamp*1000);
    String x= DateFormat('jm').format(time);
    return x;
 }

   Hourlydetails ({super.key,required this.cardIndex, required this.index, required this.timestamp,required this.temp, required this.weathericon});
   
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(getTime(timestamp),
          style: TextStyle(
            color: cardIndex == index ? Colors.white : const Color(0x4cffffff),
          ),),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset("assets/$weathericon.png",
          height: 40,
          width: 40,),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text("$temp",style: TextStyle(
            color: cardIndex == index ? Colors.white :const Color(0x4cffffff) ,
          ),),
         
        )
      ],
    );
  }
}
//for daily forcast
class DailyDataForecast extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final  weatherDataDaily;
  const DailyDataForecast({super.key, this.weatherDataDaily});

String getDay(final day) {
  DateTime time = DateTime.fromMillisecondsSinceEpoch(day*1000);
  final x= DateFormat('MMM').format(time);
  return x;
}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration:  BoxDecoration(
        color: AppTheme.sunnyColor,
        borderRadius: BorderRadius.circular(20),),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 10),
              child: const Text(
                "Next Days",
                style: TextStyle(
                  color:  Color(0x4cffffff),
                  fontSize: 17),
                ),
              ),
              dailyList(),
            ],)
        );
  }

Widget dailyList() {
   return SizedBox(
    height: 300,
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: weatherDataDaily.length>7?7:weatherDataDaily.length,
      itemBuilder: ((context, index) {
        return Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      getDay(weatherDataDaily[index].dt),
                      style: const TextStyle(
                        color:  Color(0x4cffffff),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/${weatherDataDaily[index].weather[0].icon}.png"),
                  ),
                  Text("${weatherDataDaily[index].temp!.max}/${weatherDataDaily[index].temp![0].min}")
                ],
              )
        ),
        Container(
          height: 1,
          color: const Color(0x4cffffff),
        )
        ],
        );
      })),
   );
}
}
 //for comfortlevel bar
class ComfortLevel extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final  weatherDataCurrent;

   const ComfortLevel({super.key, this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 1,left: 20,right: 20,bottom: 20),
          child: const Text("Comfort Level", style: TextStyle(
            fontSize: 18),
          ),),
          SizedBox(
            height: 180,
            child: Column(
              children: [
                Center(
                  child:  SleekCircularSlider(
                    min: 0, 
                    max: 100,
                    initialValue: weatherDataCurrent.humidty!.toDouble(),
                    appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                
                        handlerSize: 0, trackWidth: 12, progressBarWidth: 12),
                      infoProperties: InfoProperties(
                        bottomLabelText: "Humidity",
                        bottomLabelStyle: const TextStyle(letterSpacing: 0.1,fontSize: 14,height: 1.5)
                      ),
                      animationEnabled:true, size: 140,
                      customColors: CustomSliderColors(
                        progressBarColor: const Color.fromARGB(255, 1, 30, 55)
                      )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Feels Like",
                          style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                            TextSpan(
                              text: "${weatherDataCurrent.feelsLike}",
                              style: const TextStyle(
                                fontSize: 14,
                            height: 0.8,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                      ]
                    )),
                    Container(
                      height: 25,
                      margin: const EdgeInsets.only(left: 40,right: 40),
                      width: 1,
                      color: const Color(0x4cffffff),
                    ),
                     RichText(text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "UV Index",
                          style: TextStyle(
                            fontSize: 14,
                            height: 0.8,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                            TextSpan(
                              text: "${weatherDataCurrent.uvindex}",
                              style: const TextStyle(
                                fontSize: 14,
                            height: 0.8,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),])),
                  ],
                )
              ],
            ),
          )
        ],);
  }
}


