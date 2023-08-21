import 'package:counter_app/constants/enums.dart';
import 'package:counter_app/logic/cubit/internet_cubit.dart';
import 'package:counter_app/presentation/screens/second_screen.dart';
import 'package:counter_app/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Wifi) {
                return Text("Internet connection type is Wifi");
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.Mobile) {
                return Text("Mobile");
              } else if (state is InternetDisconnected) {
                return Text("Internet Disconnected");
              }
              return CircularProgressIndicator();
            }),
            SizedBox(
              height: 20,
            ),
            Text("You have pushed the button this many times: "),
            BlocConsumer<CounterCubit, CounterState>(builder: (context, state) {
              if (state.counterValue < 0) {
                return Text(
                    "You got negative value: " + state.counterValue.toString());
              } else if (state.counterValue > 0) {
                return Text(
                    "You got positive value: " + state.counterValue.toString());
              }
              return Text(state.counterValue.toString());
            }, listener: (context, state) {
              if (state.wasIncremented == true) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    "Incremented",
                  ),
                  duration: Duration(milliseconds: 500),
                ));
              } else if (state.wasIncremented == false) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Decremented"),
                  duration: Duration(milliseconds: 500),
                ));
              }
            }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                color: Theme.of(context).primaryColor,
                child: const Text(
                  "Go to Second Screen",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                }),
            MaterialButton(
                color: Theme.of(context).primaryColor,
                child: const Text(
                  "Go to Third Screen",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                })
          ],
        ),
      ),
    );
  }
}
