import random
from typing import Dict, Any


def analyze_image(image_bytes: bytes) -> Dict[str, Any]:
    """
    Placeholder ML analysis.
    Randomly returns an authentic or fake result with fixed confidence scores.
    """
    is_authentic = random.choice([True, False])
    if is_authentic:
        return {
            "is_authentic": True,
            "confidence_score": 0.95,
            "issues_detected": [],
        }
    else:
        return {
            "is_authentic": False,
            "confidence_score": 0.88,
            "issues_detected": [
                "Font inconsistency detected",
                "Logo placement mismatch",
            ],
        }
