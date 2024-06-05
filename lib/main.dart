import 'package:checkliste/app.dart';
import 'package:checkliste/src/data/database_repository.dart';
import 'package:checkliste/src/data/mock_database.dart';
import 'package:flutter/material.dart';

void main() {
  DatabaseRepository databaseRepository = MockDatabase();

  runApp(App(
    databaseRepository: databaseRepository,
  ));
}
