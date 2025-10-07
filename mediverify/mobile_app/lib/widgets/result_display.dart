import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final bool isAuthentic;
  final double confidence;
  final List<String> issues;

  const ResultDisplay({
    super.key,
    required this.isAuthentic,
    required this.confidence,
    required this.issues,
  });

  @override
  Widget build(BuildContext context) {
    final Color green = const Color(0xFF27AE60);
    final Color red = const Color(0xFFE74C3C);
    final Color bg = isAuthentic ? green.withOpacity(0.08) : red.withOpacity(0.08);

    return Container(
      width: double.infinity,
      color: bg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            isAuthentic ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: isAuthentic ? green : red,
            size: 120,
          ),
          const SizedBox(height: 12),
          Text(
            isAuthentic ? 'Authentic' : 'Warning: High-Risk Counterfeit',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: isAuthentic ? green : red,
            ),
          ),
          const SizedBox(height: 8),
          Text('Confidence: ${(confidence * 100).toStringAsFixed(1)}%'),
          const SizedBox(height: 16),
          if (issues.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Issues detected:', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: issues
                    .map((e) => Row(
                          children: [
                            const Icon(Icons.error_outline, size: 18, color: Colors.black54),
                            const SizedBox(width: 6),
                            Expanded(child: Text(e)),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
