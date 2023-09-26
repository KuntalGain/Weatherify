// For Home Screen of App

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherify/constants/theme.dart';
import 'package:weatherify/domain/bloc/weather_bloc.dart';
import 'package:weatherify/presentation/screens/search_screen.dart';
import 'package:weatherify/presentation/widgets/forcast_btn.dart';
import 'package:weatherify/presentation/widgets/notification_tile.dart';
import 'package:weatherify/presentation/widgets/weather_card.dart';
import 'package:weatherify/presentation/widgets/weather_condition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String weatherCondition = "Sunny";

  void _showNotificationBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 420,
          // Customize your bottom sheet content here
          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Your Notifications',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              // Add your notification content here
              Expanded(
                  child: ListView.builder(
                itemCount: 3,
                itemBuilder: (ctx, idx) {
                  return makeNotificationTile(Icons.sunny,
                      "Probability of heavy Rain Fall , Please Bring Umbrella with you");
                },
              )),
            ],
          ),
        );
      },
    );
  }

  late WeatherBloc weatherBloc;

  @override
  void initState() {
    super.initState();

    weatherBloc = WeatherBloc();
    BlocProvider.of<WeatherBloc>(context).add(WeatherInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getConditions(weatherCondition),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return Center(child: Text("Please Wait"));
          } else if (state is WeatherLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            );
          } else {
            return SafeArea(
              child: Column(
                children: [
                  // custom app bar

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // location
                      Row(
                        children: [
                          Image.asset(
                            'assets/pin.png',
                            color: Colors.white,
                            height: 60,
                            width: 60,
                          ),
                          const Text(
                            'New York',
                            style: AppTheme.condition,
                          ),
                        ],
                      ),
                      // Cityname
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => SearchScreen(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.search,
                              size: 34,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: _showNotificationBottomSheet,
                            child: Image.asset(
                              'assets/bell.png',
                              color: Colors.white,
                              height: 60,
                              width: 60,
                            ),
                          ),
                        ],
                      ),
                      // notification
                    ],
                  ),

                  // image

                  SizedBox(
                    height: 200,
                    width: 200,
                    child: getWeatherIcon(weatherCondition),
                  ),

                  // weather card

                  weatherCard(),

                  // forcast button

                  const SizedBox(
                    height: 20,
                  ),
                  forcastButton(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
