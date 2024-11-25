import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherwise/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherwise/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const CustomMaterialApp(),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: getThemeColor(
          BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition,
        ),
      ),
      home: const HomeView(),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'clear':
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain':
    case 'Light rain shower':
    case 'Torrential rain shower':
      return Colors.lightBlue;
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Moderate snow at times':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Patchy heavy snow':
    case 'Light snow showers':
    case 'Heavy snow showers':
    case 'Moderate snow showers':
      return Colors.lightBlue;
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.lightBlue;
    case 'Patchy freezing drizzle possible':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Ice pellets':
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.lightBlue;
    default:
      return Colors.blue;
  }
}