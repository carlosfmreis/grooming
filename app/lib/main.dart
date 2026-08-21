import 'package:app/config/colors.dart';
import 'package:app/config/events.dart';
import 'package:app/config/router.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarThemeProvider(
      calendarTheme: CalendarThemeData(
        monthViewTheme: MonthViewThemeData.dark(),
        dayViewTheme: DayViewThemeData.dark(),
        weekViewTheme: WeekViewThemeData.dark(),
        multiDayViewTheme: MultiDayViewThemeData.dark(),
      ),
      child: CalendarControllerProvider(
        controller: Events.controller,
        child: MaterialApp.router(
          title: 'Bark & Brush',
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.blue),
            scaffoldBackgroundColor: AppColors.backgroundColor,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: AppColors.mainColor, fontSize: 16.0),
              bodyMedium: TextStyle(color: AppColors.mainColor, fontSize: 14.0),
              bodySmall: TextStyle(color: AppColors.mainColor, fontSize: 12.0),
              titleLarge: TextStyle(color: AppColors.mainColor, fontSize: 20.0),
              titleMedium: TextStyle(
                color: AppColors.mainColor,
                fontSize: 18.0,
              ),
              titleSmall: TextStyle(color: AppColors.mainColor, fontSize: 16.0),
              labelLarge: TextStyle(color: AppColors.mainColor, fontSize: 14.0),
              labelMedium: TextStyle(
                color: AppColors.mainColor,
                fontSize: 12.0,
              ),
              labelSmall: TextStyle(color: AppColors.mainColor, fontSize: 10.0),
              displayLarge: TextStyle(
                color: AppColors.mainColor,
                fontSize: 16.0,
              ),
              displayMedium: TextStyle(
                color: AppColors.mainColor,
                fontSize: 14.0,
              ),
              displaySmall: TextStyle(
                color: AppColors.mainColor,
                fontSize: 12.0,
              ),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.mainColor,
              titleTextStyle: const TextStyle(
                color: Colors.white70,
                fontSize: 20.0,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.mainColor,
              selectedItemColor: AppColors.backgroundColor,
              unselectedItemColor: Colors.grey,
            ),
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
