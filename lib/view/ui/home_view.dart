import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/utils/app_string.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController nameCon = TextEditingController();
  final WeatherFactory _wf = WeatherFactory(apiKey);

  Weather? _weather;

  Future<void> getData(String name) async {
    try {
      _wf.currentWeatherByCityName(name).then(
        (value) {
          setState(() {
            _weather = value;
            print(value);
            nameCon.clear();
          });
        },
        onError: (error) {
          String errorMessage = "City Not Found";

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
          nameCon.clear();
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future currentLocationweather() async {
    await _wf
        .currentWeatherByLocation(24.860966, 66.990501)
        .then((value) => setState(() {
              _weather = value;
            }));
  }

  @override
  void initState() {
    super.initState();
    currentLocationweather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              _searchFuild(),
              SizedBox(
                height: 25,
              ),
              _cityName(),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchFuild() {
    return Container(
      width: 310,
      height: 55,
      child: TextField(
        controller: nameCon,
        cursorHeight: 28,
        selectionHeightStyle: BoxHeightStyle.tight,
        decoration: InputDecoration(
            suffixIcon: InkWell(
                onTap: () {
                  getData(nameCon.text.toString());
                },
                child: Icon(Icons.search)),
            hintText: "Search",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  Widget _cityName() {
    if (_weather == null || _weather!.date == null) {
      return Container();
    } else {
      DateTime now = _weather!.date!;

      return SizedBox(
        height: 110,
        child: Column(
          children: [
            Text(
              _weather?.areaName ?? "",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(DateFormat("h:mm a").format(now).toString()),
                SizedBox(
                  width: 8,
                ),
                Text(
                  DateFormat("EEEE").format(now).toString(),
                ),
              ],
            ),
            Text(
              DateFormat(DateFormat.YEAR_MONTH_DAY).format(now).toString(),
            ),
          ],
        ),
      );
    }
  }
}
