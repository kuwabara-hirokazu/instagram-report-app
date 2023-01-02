import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_report_app/domain/repository/insight_repository.dart';
import 'package:instagram_report_app/infrastructure/firebase/firebase_provider.dart';
import 'package:instagram_report_app/infrastructure/firebase/repository/insight_repository.dart';
import 'package:instagram_report_app/router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ProviderScope(overrides: [
    // Repositoryの上書き
    insightRepositoryProvider.overrideWith((ref) {
      final repository = InsightRepositoryImpl(
          firestore: ref.watch(firebaseFirestoreProvider));
      return repository;
    })
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'InstaRepo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}
