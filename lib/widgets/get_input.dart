import 'package:flutter/material.dart';

class GetInput extends StatefulWidget {
  final Function addToList;
  const GetInput(this.addToList, {Key? key}) : super(key: key);
  @override
  _GetInputState createState() => _GetInputState();
}

class _GetInputState extends State<GetInput> {
  final nameController = TextEditingController();
  final branchController = TextEditingController();
  final idController = TextEditingController();

  bool pressed = false;
  void checkPress() {
    if (pressed == false) {
      setState(() {
        pressed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: pressed == true
            ? EdgeInsets.only(
                top: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom +
                    10 +
                    MediaQuery.of(context).viewInsets.top,
                left: 10,
                right: 10)
            : const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(labelText: 'Name'),
              onTap: checkPress,
            ),
            TextField(
              controller: branchController,
              decoration: const InputDecoration(labelText: 'Branch'),
              onTap: checkPress,
            ),
            TextField(
                controller: idController,
                decoration: const InputDecoration(
                    labelText: 'Permanent Registration Number'),
                onTap: checkPress),
            Container(
              child: TextButton(
                  onPressed: () {
                    if (nameController.text.isEmpty ||
                        branchController.text.isEmpty ||
                        idController.text.isEmpty) {
                      return;
                    }
                    widget.addToList(
                        name: nameController.text,
                        branch: branchController.text,
                        id: idController.text);
                  },
                  child: const Text('Add Student Details')),
              alignment: Alignment.topRight,
            )
          ],
        ),
      ),
    );
  }
}
