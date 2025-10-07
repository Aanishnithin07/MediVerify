"""
MediVerify Backend API

A FastAPI application for medical verification services.
"""

import random
from typing import List
from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import asyncio
from ai_model import analyze_image, get_model_info


class VerificationResult(BaseModel):
    """Response model for medicine verification results."""
    is_authentic: bool
    confidence_score: float
    issues_detected: List[str]


# Initialize FastAPI app
app = FastAPI(
    title="MediVerify API",
    description="Backend API for MediVerify - A reliable medical verification platform",
    version="1.0.0"
)

# Add CORS middleware to allow frontend connections
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # In production, specify your frontend URL
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
async def root():
    """Root endpoint."""
    return {"message": "Welcome to MediVerify API"}


@app.get("/health")
async def health_check():
    """Health check endpoint."""
    return {"status": "ok"}


@app.post("/verify", response_model=VerificationResult)
async def verify_medicine(image: UploadFile = File(...)) -> VerificationResult:
    """
    Verify medicine authenticity from uploaded image.

    This endpoint receives an image file, processes it through AI analysis,
    and returns a structured verification result.
    """

    # Validate file type
    if not image.content_type or not image.content_type.startswith('image/'):
        raise HTTPException(status_code=400, detail="File must be an image")

    try:
        # Read image data
        image_data = await image.read()

        # Process image through AI model
        result = await analyze_image(image_data)

        return result

    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error processing image: {str(e)}")
    finally:
        # Reset file pointer for potential future use
        await image.seek(0)


@app.get("/model-info")
async def get_ai_model_info():
    """Get information about the AI model being used for verification."""
    return await get_model_info()


if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8001, reload=True)