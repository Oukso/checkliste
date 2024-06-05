import 'package:checkliste/src/data/database_repository.dart';
import 'package:checkliste/src/features/parag.dart';
import 'package:flutter/material.dart';

class CheckListeScreen extends StatefulWidget {
  final DatabaseRepository databaseRepository;
  const CheckListeScreen({super.key, required this.databaseRepository});

  @override
  State<CheckListeScreen> createState() => _CheckListeScreenState();
}

class _CheckListeScreenState extends State<CheckListeScreen> {
  late Future<List<Parag>> paragFuture = widget.databaseRepository.getParags();
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            FutureBuilder(
              future: paragFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasError) {
                  // Fall 1: Future ist komplett und hat Daten!
                  return Text("Text: ${snapshot.data}");
                } else if (snapshot.connectionState != ConnectionState.done) {
                  // Fall 2: Sind noch im Ladezustand
                  return const CircularProgressIndicator();
                } else {
                  // Fall 3: Es gab nen Fehler
                  return const Icon(Icons.error);
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _textEditingController,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () async {
                Parag ting = Parag(titele: _textEditingController.text);
                _textEditingController.clear();
                await widget.databaseRepository.addParag(ting);
              },
              child: const Text("Zahl speichern"),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () async {
                paragFuture = widget.databaseRepository.getParags();
                setState(() {});
              },
              child: const Text("Neu laden"),
            ),
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
