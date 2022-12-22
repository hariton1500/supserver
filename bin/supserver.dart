import 'package:supserver/supserver.dart' as supserver;

void main(List<String> arguments) async {
  print('Json server runnning...');
  print(await supserver.run());
}
