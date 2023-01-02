import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_report_app/util/logger.dart';

import '../../../domain/repository/insight_repository.dart';

class InsightRepositoryImpl implements InsightRepository {
  InsightRepositoryImpl({
    required this.firestore,
  });

  final FirebaseFirestore firestore;

  @override
  Future<void> getInsightReports() async {
    final doc = await firestore.collection('insight').doc('media').get();
    logger.i('取得結果: ${doc.data()}');
  }
}
