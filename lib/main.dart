import 'package:flutter/widgets.dart';
import 'package:teste_lojong/app.dart';

import 'core/injection/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  await initFeaturesDependecies();
  runApp(const App());
}
