import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc_pattern/bloc/counter_bloc/counter_bloc.dart';
import 'package:learn_bloc/bloc_pattern/bloc/counter_bloc/counter_event.dart';
import 'package:learn_bloc/bloc_pattern/bloc/counter_bloc/counter_state.dart';
import 'package:learn_bloc/bloc_pattern/views/bloc_user_profile.dart';


class BlocCounterAppPage extends StatefulWidget {
  const BlocCounterAppPage({super.key});

  @override
  State<BlocCounterAppPage> createState() => _BlocCounterAppPageState();
}

class _BlocCounterAppPageState extends State<BlocCounterAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Counter App'),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterInit) {
            return _view(context, 0);
          } else if (state is CounterUpdate) {
            return _view(context, state.counter);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
  Widget _view(BuildContext context, int value){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value.toString(), style: const TextStyle(fontSize: 24),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              FloatingActionButton(
                onPressed: (){
                  context.read<CounterBloc>().add(CounterIncrease());
                },
                heroTag: 1,
                child: const Icon(Icons.remove),
              ),

              FloatingActionButton(
                onPressed: (){
                  context.read<CounterBloc>().add(CounterDecrease());
                },
                heroTag: 2,
                child: const Icon(Icons.add),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BlocUserProfilePage()),
                );
              },
              child: const Text('Bloc User Profile'),
            ),
          ),
        ],
      ),
    );
  }
}