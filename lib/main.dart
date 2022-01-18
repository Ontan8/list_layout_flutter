import 'package:flutter/material.dart';
import 'package:liststr/widgets/get_input.dart';
import 'package:liststr/widgets/list.dart';
import './models/studentDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'List', home: ListTR());
  }
}

class ListTR extends StatefulWidget {
  const ListTR({Key? key}) : super(key: key);

  @override
  _ListTRState createState() => _ListTRState();
}

class _ListTRState extends State<ListTR> {
  final List<StudentDetailsTR> theList = [
    StudentDetailsTR(id: '20', name: 'Tanishq', branch: 'Computer'),
    StudentDetailsTR(id: '12', name: 'Raiden Shogun', branch: 'Computer'),
    StudentDetailsTR(branch: 'Computer', id: 'F19112000', name: 'Yae Miko')
  ];
  void addStudentSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GetInput(addStudent);
        });
  }

  void addStudent(
      {required String name, required String branch, required String id}) {
    setState(() {
      theList.add(StudentDetailsTR(id: id, name: name, branch: branch));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListTR'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListGen(theList),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addStudentSheet(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
