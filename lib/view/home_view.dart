import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/provider/counter_provider.dart';
import 'package:weatherapp/utils/routes/routes_name.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, value, child) {
        return Scaffold(
          // appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value.counter.toString()),
                IconButton(
                    onPressed: () {
                      value.addValue();
                    },
                    icon: Icon(Icons.add))
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, ProfileViewRoute);
            },
            child: Text("go"),
          ),
        );
      },
    );
  }
}
