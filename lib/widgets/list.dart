import 'package:flutter/material.dart';
import '../models/student_details.dart';
import 'dart:math';

class ListGen extends StatelessWidget {
  final List<StudentDetailsTR> details;
  const ListGen(this.details, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
          children: details.map((element) {
        return Container(
          decoration: const BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.teal, blurRadius: 0.8)],
          ),
          height: 100,
          child: Card(
            child: Row(
              children: [
                SizedBox(
                  // decoration: BoxDecoration(color: Colors.blue),
                  width: constraints.maxWidth * 0.25,
                  child: CircleAvatar(
                    backgroundColor: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    radius: 30,
                    child: Text(
                      element.name[0].toUpperCase(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Name: ${element.name}',
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Branch: ${element.branch}'),
                          Text('ID: ${element.id}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList());
    });
  }
}
