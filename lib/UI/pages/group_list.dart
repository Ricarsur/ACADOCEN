import 'package:acadocen/UI/pages/pages.dart';
import 'package:flutter/material.dart';

class GroupList extends StatefulWidget {
  const GroupList({super.key});

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  final List<Group> _groupList = listGroup;

  @override
  Widget build(BuildContext context) {
    var _query = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(top: 50, left: _query / 17, right: _query / 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Listado de grupos',
                style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 106, 106, 106),
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            ListView.builder(
                shrinkWrap: true,
                itemCount: _groupList.length,
                itemBuilder: (context, pos) {
                  return Column(
                    children: [
                      Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              ColorsApp.gradiant1,
                              ColorsApp.gradiant2,
                            ],
                          ),
                        ),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                          color: Colors.transparent,
                          onPressed: () {},
                          child: Row(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _groupList[pos].course,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(_groupList[pos].name,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13)),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ]),
                        ),
                      ),
                      SizedBox(height: 15)
                    ],
                  );
                }),
          ],
        ),
      ),
    ));
  }
}
