import 'package:flutter/material.dart';

class AttendanceList extends StatefulWidget {
  final List<dynamic> students;
  const AttendanceList({super.key, required this.students});

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<AttendanceList> {
  bool _failed = false;
  bool _attended = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: widget.students.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  title: Text(widget.students[index]['name']),
                  subtitle: Text(widget.students[index]['email']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        value: _attended,
                        onChanged: (value) {
                          setState(() {
                            _failed == false
                                ? _attended = !_attended
                                : _attended = false;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        value: _failed,
                        onChanged: (value) {
                          setState(() {
                            _attended == false
                                ? _failed = !_failed
                                : _failed = false;
                          });
                        },
                        activeColor: Colors.red,
                      ),
                    ],
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
