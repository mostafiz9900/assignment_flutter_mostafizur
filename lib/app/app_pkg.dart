export '../app/core/core.dart';
export '../app/data/data.dart';
export '../app/global_widgets/global_widgets.dart';
export '../app/modules/modules.dart';
export 'routes/routes.dart';
export 'app_binding.dart';
export 'di.dart';
export 'my_app.dart';
export '../main.dart';

const kLOGTAG = "[Cart24-Flutter]";
const kLOGENABLE = true;

printLog(dynamic data) {
  if (kLOGENABLE) {
    print("$kLOGTAG: ${data.toString()}");
  }
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}