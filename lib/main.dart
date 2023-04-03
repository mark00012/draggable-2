import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Draggable'),
      ),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Draggable(
            data: 1,
            feedback: Container(
              color: Colors.deepOrange,
              height: 150,
              width: 150,
              child: Icon(Icons.add),
            ),
            childWhenDragging: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset('assets/IMG_3456.JPG')),
            child: Container(
                height: 150,
                width: 150,
                child: Image.asset('assets/IMG_3447 2.JPG'))),
        DragTarget(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Container(
              height: 150,
              width: 150,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment(0, 1),
                    children: [
                      Image.asset('assets/IMG_3456.JPG'),
                      Text(
                        'Received $acceptedData',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          onAccept: (int data) {
            setState(() {
              acceptedData += data;
            });
          },
        )
      ],
    );
  }
}
