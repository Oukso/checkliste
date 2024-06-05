import 'package:checkliste/src/data/database_repository.dart';
import 'package:checkliste/src/features/parag.dart';

class MockDatabase implements DatabaseRepository {
  List<Parag> parags = [];
  @override
  Future<List<Parag>> getParags() async {
    await Future.delayed(const Duration(seconds: 2));
    return parags;
  }

  @override
  Future<void> addParag(Parag t) async {
    await Future.delayed(const Duration(seconds: 2));
    parags.add(t);
  }
}
