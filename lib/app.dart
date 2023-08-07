import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_task/src/Aplication/Schedule/Bloc/schedule_bloc.dart';
import 'src/Aplication/Schedule/Presintation/screen/schedule_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Udevs Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        lazy: false,
        create: (context) => ScheduleBloc(),
        child: const ScheduleScreen(),
      ),
    );
  }
}