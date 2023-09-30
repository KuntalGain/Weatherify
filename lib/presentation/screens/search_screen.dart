import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherify/data/data.dart';
import 'package:weatherify/presentation/screens/home_screen.dart';

import '../../constants/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              height: 57,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.2, 0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.search,
                    color: AppTheme.sunnyColor,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      enableSuggestions: true,
                      controller: _searchController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onFieldSubmitted: (value) {
                        Get.to(HomeScreen(cityname: value.toString()));
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Popular Cities 🔥',
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: indianCities.length,
                  itemBuilder: (ctx, idx) => GestureDetector(
                        onTap: () {
                          Get.to(HomeScreen(cityname: indianCities[idx]));
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppTheme.stormyColor,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                indianCities[idx],
                                style: AppTheme.condition,
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
