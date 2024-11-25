import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherwise/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weatherwise/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weatherwise/views/search_view.dart';
import 'package:weatherwise/widgets/no_weather_body.dart';
import 'package:weatherwise/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WeatherWise',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20, // Font size
            fontWeight: FontWeight.bold,
          ),
          // Set text color to white
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple], // Choose your colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search_sharp,
              color: Colors.white, // Set icon color to white
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody();
          } else {
            return const Text('oops there was an error');
          }
        },
      ),
    );
  }
}
