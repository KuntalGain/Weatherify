// For Home Screen of App

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:weatherify/constants/theme.dart';
import 'package:weatherify/data/database/notification_db.dart';
import 'package:weatherify/data/model/notification.dart';
import 'package:weatherify/data/model/weather.dart';
import 'package:weatherify/data/repos/forcast_repository.dart';
import 'package:weatherify/data/services/notiification_service.dart';
import 'package:weatherify/domain/weather/weather_bloc.dart';
import 'package:weatherify/presentation/widgets/forcast_btn.dart';
import 'package:weatherify/presentation/widgets/notification_tile.dart';
import 'package:weatherify/presentation/widgets/weather_card.dart';
import 'package:weatherify/presentation/widgets/weather_condition.dart';

import '../../data/model/forcast.dart';
// ignore: unused_import

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.cityname});

  final String cityname;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ForcastRepository repository = ForcastRepository();

  List<NotificationModel> notificationList = [];

  // reference of Local Storage
  final _myBox = Hive.box('notification');

  NotificationDB db = NotificationDB();

  void _showNotificationBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 80 * (notificationList.length + 1),
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
                itemCount: notificationList.length,
                itemBuilder: (ctx, idx) {
                  return makeNotificationTile(
                    Icons.sunny,
                    notificationList[idx],
                  );
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
    // if User open App for First Time

    if (_myBox.get("WEATHERIFY") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();

    for (var item in db.alerts) {
      print("[DEBUG] : ${item.alert}");
    }

    notificationList = db.alerts.reversed.toList();

    weatherBloc = WeatherBloc();
    BlocProvider.of<WeatherBloc>(context).add(WeatherInitialEvent());
    BlocProvider.of<WeatherBloc>(context)
        .add(RequestWeatherEvent(cityName: widget.cityname));

    fetchHourlyWeatherData();
  }

  List<HourlyForecast> hourlyForcastData = [];

  Future<void> fetchHourlyWeatherData() async {
    try {
      final data = await repository.fetchForcastDataHR(widget.cityname);

      setState(() {
        hourlyForcastData = data;
      });
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    bool hasConditionBeenMetToday = false;

    for (var item in hourlyForcastData) {
      String originalTime = item.time;
      DateTime dateTime = DateTime.parse(originalTime);
      String formattedTime = DateFormat.Hm().format(dateTime);

      if (item.willRain > 70 &&
          dateTime.hour <= 24 &&
          dateTime.hour >= DateTime.now().hour &&
          !hasConditionBeenMetToday) {
        // Create a notification
        NotificationService().showNotification(
            title: 'Probability of Heavy Rain Fall at $formattedTime today',
            body: 'Please Bring Umbrella');

        db.alerts.add(
          NotificationModel(
            alert: 'Probability of Heavy Rain Fall at $formattedTime today',
            dateTime: DateFormat('d,MMM').format(DateTime.now()),
          ),
        );

        db.updateDB();
        hasConditionBeenMetToday = true;
        break;
      }
    }

    return Scaffold(
      backgroundColor: AppTheme.sunnyColor,
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return SizedBox();
          } else if (state is WeatherLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (state is WeatherLoadedState) {
            final Weather weather = state.weatherData;

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
                          Text(
                            widget.cityname,
                            style: AppTheme.condition,
                          ),
                        ],
                      ),
                      // Cityname
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<WeatherBloc>(context).add(
                                SearchBtnPressedEvent(context: context),
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
                    child: Image.asset(
                        getWeatherIcon(state.weatherData.condition)),
                  ),

                  // weather card

                  weatherCard(weather),

                  // forcast button

                  const SizedBox(
                    height: 20,
                  ),
                  forcastButton(widget.cityname),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
