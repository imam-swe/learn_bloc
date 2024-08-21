import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc_cubit/cubit/counter_cubit/counter_cubit.dart';
import 'package:learn_bloc/bloc_cubit/cubit/counter_cubit/counter_cubit_state.dart';
import 'package:learn_bloc/bloc_cubit/view/cubit_user_profile.dart';

class CubitCounterAppPage extends StatefulWidget {
  const CubitCounterAppPage({super.key});

  @override
  State<CubitCounterAppPage> createState() => _CubitCounterAppPageState();
}

class _CubitCounterAppPageState extends State<CubitCounterAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter App'),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterCubit, CounterCubitState>(
        builder: (context, state){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (state is CounterValueUpdated) ? Text(state.counter.toString(),)
                    : const Text("0"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    
                    FloatingActionButton(
                      onPressed: (){
                        context.read<CounterCubit>().counterDecrease();
                      },
                      heroTag: 1,
                      child: const Icon(Icons.remove),
                    ),

                    FloatingActionButton(
                      onPressed: (){
                        context.read<CounterCubit>().counterIncrease();
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
                        MaterialPageRoute(builder: (context) => const CubitUserProfilePage()),
                      );
                    },
                    child: const Text('Fetch User Data'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}