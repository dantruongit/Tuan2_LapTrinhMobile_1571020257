import 'package:flutter/material.dart';

Stream<int> layDuLieu() async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: StreamBuilder<int>(
          stream: layDuLieu(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else if(snapshot.hasError){
              return Text('Loi ${snapshot.error}');
            }
            else
              return Text('Du lieu nguoi dung : ${snapshot.data}');
          },
        ),
      ),
    );
  }
}


