Stream<int> layDuLieu() async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 2));
    yield i;
  }
}

void main(List<String> args) async {
  await for (var dem in layDuLieu()) {
    print('Dem : $dem');
  }
}
