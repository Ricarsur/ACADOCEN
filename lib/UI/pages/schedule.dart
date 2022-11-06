import 'package:acadocen/UI/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:acadocen/domain/utils/date_utils.dart' as date_utils;

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  late ScrollController scrollController;
  List<DateTime> currentMonthsList = List.empty();
  DateTime _dateNow = DateTime.now();
  late String monthName = DateFormat('MMM').format(_dateNow);

  void initState() {
    super.initState();
    currentMonthsList = date_utils.DateUtils.daysInMonth(_dateNow);
    currentMonthsList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthsList = currentMonthsList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * _dateNow.day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      date_utils.DateUtils.weekdays[_dateNow.weekday - 1],
                      style: const TextStyle(
                          fontSize: 26,
                          color: Color.fromARGB(255, 106, 106, 106),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                        date_utils.DateUtils.months[_dateNow.month - 1] +
                            ' ' +
                            _dateNow.day.toString() +
                            ', ' +
                            _dateNow.year.toString(),
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 106, 106, 106),
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            WeeklyDatePicker(
              monthName: monthName,
              selectedDay: _dateNow,
              changeDay: (value) => setState(() {
                _dateNow = value;
              }),
              enableWeeknumberText: false,
              weeknumberColor: const Color.fromARGB(255, 30, 82, 160),
              weeknumberTextColor: const Color.fromARGB(255, 186, 5, 5),
              weekdayTextColor: const Color.fromARGB(255, 65, 65, 65),
              digitsColor: const Color.fromARGB(255, 38, 53, 132),
              selectedBackgroundColor: const Color.fromARGB(255, 71, 71, 198),
              weekdays: const ["Lun", "Mar", "Mie", "Jue", "Vie", "Sáb", "Dom"],
              daysInWeek: 7,
            ),
            Column(
              children: [
                SizedBox(height: 80),
                Image.asset(
                  'assets/images/claritysad.png',
                  width: 80,
                ),
                SizedBox(height: 10),
                Text(
                  '¡Aún no tienes ningún horario creado',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'agregue nuevas tareas para que \nsu día sea productivo',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
