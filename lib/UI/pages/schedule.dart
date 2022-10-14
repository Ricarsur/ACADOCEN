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

  Widget topView() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 0.0, top: 25.0, bottom: 0.0),
        child: Center(
          child: Wrap(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 2 / 3,
                child: TextField(
                  key: const Key('search'),
                  autofocus: false,
                  controller: _controller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.black38),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
                size: 26.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [topView()],
    ));
  }
}
