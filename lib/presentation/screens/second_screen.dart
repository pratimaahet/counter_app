import 'package:counter_app/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 112, 86, 8),
        centerTitle: true,
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("You have pushed the button this many times: "),
            BlocConsumer<CounterCubit, CounterState>(builder: (context, state) {
              if (state.counterValue < 0) {
                return Text(
                    "You got negative value: " + state.counterValue.toString());
              } else if (state.counterValue > 0) {
                return  Text(
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
                  backgroundColor: const Color.fromARGB(255, 112, 86, 8),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 112, 86, 8),
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
                color: const Color.fromARGB(255, 112, 86, 8),
                child: const Text(
                  "Go to Third Screen",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                }),
            MaterialButton(
                color: const Color.fromARGB(255, 112, 86, 8),
                child: const Text(
                  "Go to Home Screen",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                })
          ],
        ),
      ),
    );
  }
}
