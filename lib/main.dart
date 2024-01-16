import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_lojong/app.dart';

import 'core/injection/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  await initFeaturesDependecies();
  ChuckerFlutter.showNotification = true;
  runApp(const App());
}
