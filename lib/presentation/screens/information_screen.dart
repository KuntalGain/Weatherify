import 'package:flutter/material.dart';
import 'package:weatherify/constants/theme.dart';
import 'package:weatherify/data/model/forcast.dart';
import 'package:weatherify/data/repos/forcast_repository.dart';
import 'package:weatherify/presentation/widgets/forcast_card.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key, required this.cityname});

  final String cityname;

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  // ignore: non_constant_identifier_names
  DateTime curr_time = DateTime.now();
  ForcastRepository repo = ForcastRepository();

  List<HourlyForecast> hourlyForcastData = [];
  List<WeeklyForecast> weeklyForcastData = [];

  Future<void>? hourlyDataFuture;
  Future<void>? weeklyDataFuture;

  @override
  void initState() {
    super.initState();
    hourlyDataFuture = fetchHourlyWeatherData();
    weeklyDataFuture = fetchWeeklyWeatherData();
  }

  Future<void> fetchHourlyWeatherData() async {
    try {
      final data = await repo.fetchForcastDataHR(widget.cityname);

      setState(() {
        hourlyForcastData = data;
      });
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> fetchWeeklyWeatherData() async {
    try {
      final data = await repo.fetchForcastDataWK(widget.cityname);

      setState(() {
        weeklyForcastData = data;
      });
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.sunnyColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.settings_outlined,
                //     size: 35,
                //     color: Colors.white,
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "24-Hour Forcast",
                    style: AppTheme.condition,
                  ),
                  Text(
                    '${curr_time.day}/${curr_time.month}',
                    style: AppTheme.condition,
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.all(10),
              child: FutureBuilder(
                  future: hourlyDataFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: hourlyForcastData.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, idx) {
                              return hourlyForcastCard(hourlyForcastData[idx]);
                            }),
                      );
                    }
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Next 7 Days Forcast",
                style: AppTheme.condition,
              ),
            ),
            FutureBuilder(
                future: weeklyDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    return Expanded(
                        child: ListView.builder(
                      itemCount: weeklyForcastData.length,
                      itemBuilder: (ctx, idx) =>
                          dailyForcastCard(weeklyForcastData[idx]),
                    ));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
