import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'Task 1 data';
  print('Task 1 Complete');
}

// Future is a data type for async functions. They operate kind of like a receipt.
// They will get back to you when they have finished!!!
Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);

  String result;

  // Test Async delay function... wait keyword tells this function to not move on
  // until this Future.delay function has finished!
  await Future.delayed(
    threeSeconds,
    () {
      String result = 'Task 2 data';
      print('Task 2 Complete');
    },
  );

  return result;
}

void task3(String taskTwoData) {
  String result = 'Task 3 data';
  print('Task 3 Complete with $taskTwoData');
}
