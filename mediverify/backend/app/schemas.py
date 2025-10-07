from pydantic import BaseModel
from typing import List, Optional


class VerificationResult(BaseModel):
    is_authentic: bool
    confidence_score: float
    issues_detected: Optional[List[str]] = []
    timestamp: str
