import 'services/cat_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc/cat_bloc.dart';
import 'screens/home_screen.dart';
import 'package:flutter/services.dart';

void main() {
  // We need to call it manually,
  // because we going to call setPreferredOrientations()
  // before the runApp() call
  WidgetsFlutterBinding.ensureInitialized();

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cat Tinder',
      theme: ThemeData(
        textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.black, fontSize: 20)),
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => CatService(),
          ),
        ],
        child: BlocProvider(
          create: (context) =>
              CatBloc(RepositoryProvider.of<CatService>(context))
                ..add(LoadApiEvent()),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
