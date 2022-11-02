import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget {
  final IconButton? iconBacks;
  final String title;
  final String? description;
  final IconButton? icon;

  const ToolBar(
      {super.key,
      this.iconBacks,
      required this.title,
      this.description,
      this.icon});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 100,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                iconBacks ?? const SizedBox(),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                icon ?? const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
