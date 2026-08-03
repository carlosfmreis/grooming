import 'package:app/config/colors.dart';
import 'package:app/config/events.dart';
import 'package:app/config/routes.dart';
import 'package:app/pages/calendar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Events.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bark & Brush')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Marcações',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Animais'),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [CalendarPage(), Placeholder()],
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          context.push(_currentIndex == 0 ? Routes.addBooking : Routes.addPet);
        },
        icon: Icon(Icons.add, color: AppColors.backgroundColor),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey;
            }
            if (states.contains(WidgetState.pressed)) {
              return Colors.blueGrey;
            }
            return AppColors.mainColor;
          }),
        ),
      ),
    );
  }
}
