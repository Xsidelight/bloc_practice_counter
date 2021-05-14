import 'package:bloc_practice_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_practice_counter/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetDisconnected) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Text('No Internet Connection'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Ok'),
                ),
              ],
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                    if (state is InternetConnected) {
                      return Icon(
                        Icons.wifi,
                        color: Colors.green,
                      );
                    } else {
                      return Icon(
                        Icons.signal_wifi_off,
                        color: Colors.red,
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 100),
                        content: Text('Incremented'),
                      ),
                    );
                  } else if (state.wasIncremented == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 100),
                        content: Text('Decremented'),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Text(
                    '${state.counterValue.toString()}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: 'one',
                    tooltip: 'Decrement',
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: 'two',
                    tooltip: 'Increment',
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/second_screen'),
                child: Text('Second Screen'),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/third_screen'),
                child: Text('Third Screen'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
