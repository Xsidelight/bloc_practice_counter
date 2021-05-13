import 'package:bloc_practice_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  // group - way of organizing multiple tests for a feature
  group('CounterCubit', () {
    CounterCubit? counterCubit;

    // the objects our test will be working with
    // so that we can access it later on
    setUp(() {
      counterCubit = CounterCubit();
    });


    // function that is called after each test is run
    // it will apply only to the tests in the group
    tearDown(() {
      counterCubit!.close();
    });

    test('the initial state is counter test with ', () {
      expect(counterCubit!.state, CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue:1, wasIncrement: true) '
      'when cubit.increment() function is called',
      //'build' - a function that will return the current instance of the counter cubit
      // in order to make it available to the testing process
      build: () => counterCubit!,
      // 'act' - a function that will take the cubit and return action applied on it
      act: (cubit) => cubit.increment(),
      // 'expect' - iterable list which will verify if the order of the states and
      // the actual emited states correspond with the emited ones and no other
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue:-1, wasIncrement: false) '
      'when cubit.decrement() function is called ',
      build: () => counterCubit!,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
