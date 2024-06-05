import 'package:checkliste/src/features/parag.dart';

abstract class DatabaseRepository {
  Future<List<Parag>> getParags();
  Future<void> addParag(Parag t);
}
