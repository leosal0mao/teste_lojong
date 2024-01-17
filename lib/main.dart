import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:teste_lojong/app.dart';
import 'package:teste_lojong/features/app/di/dependency_injection.dart';

import 'core/injection/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  initApp();
  ChuckerFlutter.showNotification = true;
  runApp(const App());
}
