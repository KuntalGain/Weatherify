import 'package:flutter/material.dart';
import 'package:weatherify/constants/theme.dart';
import 'package:weatherify/presentation/widgets/forcast_card.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key, required this.cityname});

  final String cityname;

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  DateTime curr_time = DateTime.now();

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
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings_outlined,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
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
              child: Expanded(
                child: ListView.builder(
                    itemCount: 24,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, idx) {
                      int time = curr_time.hour + idx;

                      if (time >= 24) {
                        time = time - 24;
                      }

                      return (idx == 0)
                          ? hourlyForcastCard(true, time)
                          : hourlyForcastCard(false, time);
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Next Forcast",
                style: AppTheme.condition,
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              itemBuilder: (ctx, idx) => dailyForcastCard(),
            )),
          ],
        ),
      ),
    );
  }
}
