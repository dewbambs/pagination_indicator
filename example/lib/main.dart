import 'package:flutter/material.dart';
import 'package:pagination_indicator/pagination_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Text("data"),
            PaginationIndicator(
              onPageChanged: (index) {
                print("page count is $index");
              },
              initialValue: 5,
              pageCount: 6,
              visiblePageCount: 5,
            ),
            Text("data")
          ],
        ),
      ),
    );
  }
}
