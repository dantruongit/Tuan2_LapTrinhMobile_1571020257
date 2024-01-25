import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});//Ham Khoi tao
  //Giao dien
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinh tong 2 man hinh',
      theme : ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: MyCal(), // Goi den man hinh MyCal
    );
  }
}

//Dinh nghia activity (quan ly trang thai)
class MyCal extends StatefulWidget{
  @override
  _MyCalState createState() {
    return _MyCalState();
  }
}

class _MyCalState extends State<MyCal>{
  TextEditingController num1Control = TextEditingController();//Text 1
  TextEditingController num2Control = TextEditingController();//Text 2
  String ketqua = "";
  void tinhTong(){
    double num1 = double.tryParse(num1Control.text) ?? 0.0;
    double num2 = double.tryParse(num2Control.text) ?? 0.0;
    double num = num1 + num2;
    //Cap nhat trang thai
    setState(() {
      ketqua = 'Tong $num';
    });
    //Chuyen sang man hinh ket qua
    Navigator.push(context, MaterialPageRoute(builder : (context)=>ManHinhKetQua(ketqua)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ung dung tinh tong')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Thanh phan chinh
            TextField(
              controller: num1Control,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nhap so 1'),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: num2Control,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nhap so 2'),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: tinhTong, child: Text('Tinh tong')),
            SizedBox(height: 20)
            //Hien thi ket qua
          ],
        )
      ),
    );
  }
}

//Dinh nghia manhinhketqua

class ManHinhKetQua extends StatelessWidget{
  final String ketqua;
  ManHinhKetQua(this.ketqua);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ket qua tinh tong'),),
      body: Center(
        child : Text(
            'Ket qua la ${this.ketqua}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      )
    );
  }
  
}