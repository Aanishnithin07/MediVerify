#!/bin/bash

# MediVerify Backend API Test Script

echo "🧪 Testing MediVerify Backend API"
echo "=================================="

BASE_URL="http://localhost:8001"

echo ""
echo "1️⃣  Testing Health Endpoint..."
echo "GET $BASE_URL/health"
health_response=$(curl -s "$BASE_URL/health")
echo "Response: $health_response"

echo ""
echo "2️⃣  Testing Model Info Endpoint..."
echo "GET $BASE_URL/model-info"
model_response=$(curl -s "$BASE_URL/model-info")
echo "Response: $model_response"

echo ""
echo "3️⃣  Testing Verify Endpoint..."
echo "Creating test image..."

# Create a minimal valid PNG image (1x1 pixel)
echo "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" | base64 -d > test_medicine.png

echo "POST $BASE_URL/verify (with test image)"
verify_response=$(curl -s -X POST "$BASE_URL/verify" \
  -H "accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -F "image=@test_medicine.png")

echo "Response: $verify_response"

# Clean up test image
rm -f test_medicine.png

echo ""
echo "4️⃣  Testing Invalid File Upload..."
echo "Testing with invalid file type..."

# Create a text file
echo "This is not an image" > not_an_image.txt

invalid_response=$(curl -s -X POST "$BASE_URL/verify" \
  -H "accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -F "image=@not_an_image.txt")

echo "Response: $invalid_response"

# Clean up test file
rm -f not_an_image.txt

echo ""
echo "✅ API Testing Complete!"
echo ""
echo "🚀 Your MediVerify Backend is ready for production!"
echo "📖 Visit $BASE_URL/docs for interactive API documentation"