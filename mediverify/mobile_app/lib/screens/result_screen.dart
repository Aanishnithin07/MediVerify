import 'package:flutter/material.dart';
import '../widgets/result_display.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> result;
  const ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final bool isAuthentic = result['is_authentic'] as bool? ?? false;
    final double confidence = (result['confidence_score'] as num?)?.toDouble() ?? 0.0;
    final List<dynamic> issues = result['issues_detected'] as List<dynamic>? ?? [];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ResultDisplay(
                isAuthentic: isAuthentic,
                confidence: confidence,
                issues: issues.cast<String>(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('Scan Another'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
