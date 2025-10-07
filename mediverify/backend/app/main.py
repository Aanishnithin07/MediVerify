from datetime import datetime
from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.responses import JSONResponse
from .schemas import VerificationResult
from .ml_handler import analyze_image
from . import utils

app = FastAPI(title="MediVerify API", version="0.1.0")


@app.get("/health")
def health_check():
    return {"status": "ok"}


@app.post("/verify", response_model=VerificationResult)
async def verify_image(file: UploadFile = File(...)):
    if not file or not file.filename:
        raise HTTPException(status_code=400, detail="No file uploaded")

    if file.content_type is None or not file.content_type.startswith("image/"):
        raise HTTPException(status_code=400, detail="Uploaded file must be an image")

    try:
        image_bytes = await file.read()
        # Ensure it is a valid image
        utils.load_image_from_bytes(image_bytes)

        result = analyze_image(image_bytes)
        response = VerificationResult(
            is_authentic=result["is_authentic"],
            confidence_score=result["confidence_score"],
            issues_detected=result.get("issues_detected", []),
            timestamp=datetime.utcnow().isoformat() + "Z",
        )
        return JSONResponse(status_code=200, content=response.model_dump())
    except HTTPException:
        raise
    except Exception as exc:  # noqa: BLE001
        raise HTTPException(status_code=400, detail=f"Invalid image or processing error: {exc}")
