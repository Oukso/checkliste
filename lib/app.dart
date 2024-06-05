import 'package:checkliste/src/data/database_repository.dart';
import 'package:checkliste/src/features/check_liste_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final DatabaseRepository databaseRepository;
  const App({super.key, required this.databaseRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CheckListeScreen(
        databaseRepository: databaseRepository,
      ),
    );
  }
}
