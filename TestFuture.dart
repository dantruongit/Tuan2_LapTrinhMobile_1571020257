Future<int> layDuLieu() async {
  await Future.delayed(Duration(seconds: 2));
  return 50;
}

void main(List<String> args) {
  print('Du lieu nguoi dung ... ');
  layDuLieu().then((value) {
    print('Du lieu : ${value}');
  });
  print('Chuong trinh tiep tuc chay ... ');
}
