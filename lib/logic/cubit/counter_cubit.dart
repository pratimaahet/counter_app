import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: true));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}



// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:counter_app/constants/enums.dart';
// import 'package:meta/meta.dart';

// import 'package:counter_app/logic/cubit/internet_cubit.dart';

// part 'counter_state.dart';

// class CounterCubit extends Cubit<CounterState> {
//   final InternetCubit internetCubit;
//   StreamSubscription internetStreamSubscription;
//   CounterCubit({
//     required this.internetCubit,
//     required this.internetStreamSubscription,
//   }) : super(CounterState(counterValue: 0, wasIncremented: true)) {
//     internetStreamSubscription = internetCubit.listen((internetState) {
//       if (internetState is InternetConnected &&
//           internetState.connectionType == ConnectionType.Wifi) {
//         increment();
//       } else if (internetState is InternetConnected &&
//           internetState.connectionType == ConnectionType.Mobile) {
//         decrement();
//       } 
//     });
//   }

//   void increment() => emit(
//       CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

//   void decrement() => emit(CounterState(
//       counterValue: state.counterValue - 1, wasIncremented: false));

//       @override
//       Future<void> close(){
//         internetStreamSubscription.cancel();
//         return super.close();
//       }
// }
