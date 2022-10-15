import 'package:flutter/material.dart';
import 'package:acadocen/domain/utils/date_utils.dart' as date_utils;

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController _scrollController;
  List<DateTime> currentMonths = List.empty();
  final DateTime _selectedDay = DateTime.now();
  final List<String> _days = <String>[];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    currentMonths = date_utils.DateUtils.daysInMonth(_selectedDay);
    currentMonths.sort((a, b) => a.day.compareTo(b.day));
    currentMonths = currentMonths.toSet().toList();
    _scrollController =
        ScrollController(initialScrollOffset: 70.0 * _selectedDay.day);
    super.initState();
  }

  Widget dayView() {
    return Text(date_utils.DateUtils.formatDay(_selectedDay));
  }

  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(89, 60, 0, 20),
      child: Text(
        date_utils.DateUtils.months[_selectedDay.month - 1] +
            ' ' +
            _selectedDay.year.toString(),
        style: const TextStyle(
          color: Color.fromARGB(255, 119, 119, 119),
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget horizontalView() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [dayView(), titleView()],
    ));
  }
}
