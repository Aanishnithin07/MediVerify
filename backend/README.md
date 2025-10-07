# MediVerify Backend API

A powerful FastAPI backend for medical verification services with AI-powered image analysis.

## 🚀 **Features**

### ✨ **Verification Endpoint**
- **POST `/verify`**: Upload medicine images for authenticity verification
- **Pydantic Response Models**: Structured `VerificationResult` with type validation
- **File Type Validation**: Supports JPEG, PNG, GIF, BMP, WEBP formats
- **Comprehensive Error Handling**: Graceful error responses with detailed messages

### 🤖 **AI-Powered Analysis**
- **Placeholder AI Logic**: Random verification results for development
- **Structured Results**:
  - `is_authentic` (boolean): True for genuine, False for counterfeit
  - `confidence_score` (float): AI model confidence (0.0 to 1.0)
  - `issues_detected` (list): Specific problems found in counterfeit medicines

### 📊 **Additional Endpoints**
- **GET `/health`**: Health check for monitoring
- **GET `/model-info`**: AI model information and capabilities
- **GET `/`**: Welcome endpoint with API information

## 🏗 **Architecture**

### **File Structure**
```
backend/
├── main.py           # FastAPI application with endpoints
├── ai_model.py       # AI logic and image analysis
├── requirements.txt  # Python dependencies
├── start.sh         # Startup script
└── server.log       # Runtime logs
```

### **Core Components**

#### **FastAPI Application (`main.py`)**
- **CORS Middleware**: Configured for frontend integration
- **Pydantic Models**: Type-safe request/response validation
- **Error Handling**: HTTP exceptions with meaningful messages
- **Auto-generated Documentation**: Available at `/docs` and `/redoc`

#### **AI Model (`ai_model.py`)**
- **Async Image Analysis**: Non-blocking image processing
- **Validation Functions**: Image format verification
- **Configuration System**: Customizable AI parameters
- **Preprocessing Pipeline**: Image metadata extraction (placeholder)

## 📋 **API Endpoints**

### **POST /verify**
Upload and verify medicine image authenticity.

**Request:**
- Content-Type: `multipart/form-data`
- Field: `image` (file upload)

**Response Model: `VerificationResult`**
```json
{
  "is_authentic": boolean,
  "confidence_score": float,
  "issues_detected": ["string"]
}
```

**Examples:**

*Genuine Medicine:*
```json
{
  "is_authentic": true,
  "confidence_score": 0.98,
  "issues_detected": []
}
```

*Counterfeit Medicine:*
```json
{
  "is_authentic": false,
  "confidence_score": 0.92,
  "issues_detected": [
    "Font inconsistency detected",
    "Logo placement mismatch"
  ]
}
```

### **GET /health**
Health check endpoint for monitoring.

**Response:**
```json
{
  "status": "ok"
}
```

### **GET /model-info**
AI model information and capabilities.

**Response:**
```json
{
  "model_name": "MediVerify Placeholder AI v1.0",
  "model_type": "Random Classification (Placeholder)",
  "version": "1.0.0",
  "supported_formats": ["JPEG", "PNG", "GIF", "BMP", "WEBP"],
  "max_image_size": 10485760,
  "accuracy": "Placeholder - not applicable",
  "last_trained": "N/A - Placeholder model",
  "capabilities": [
    "Medicine authenticity detection",
    "Issue identification",
    "Confidence scoring"
  ]
}
```

## 🛠 **Installation & Setup**

### **Prerequisites**
- Python 3.8+
- Virtual environment support
- FastAPI and dependencies

### **Installation**
```bash
# Navigate to backend directory
cd backend

# Create virtual environment
python -m venv .venv

# Activate virtual environment
source .venv/bin/activate  # Linux/Mac
# or
.venv\Scripts\activate     # Windows

# Install dependencies
pip install -r requirements.txt
```

### **Dependencies**
```
fastapi==0.104.1
uvicorn[standard]==0.24.0
python-multipart==0.0.6
```

## 🏃‍♂️ **Running the Server**

### **Option 1: Direct Python**
```bash
python main.py
```

### **Option 2: Uvicorn CLI**
```bash
uvicorn main:app --host 0.0.0.0 --port 8001 --reload
```

### **Option 3: Startup Script**
```bash
./start.sh
```

### **Background Process**
```bash
nohup python main.py > server.log 2>&1 &
```

## 🧪 **Testing**

### **Health Check**
```bash
curl http://localhost:8001/health
```

### **Model Information**
```bash
curl http://localhost:8001/model-info
```

### **Image Verification**
```bash
curl -X POST "http://localhost:8001/verify" \
  -H "accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -F "image=@test_image.png"
```

### **API Documentation**
- **Interactive Docs**: http://localhost:8001/docs
- **ReDoc**: http://localhost:8001/redoc

## 🔧 **Configuration**

### **AI Model Configuration**
```python
class AIModelConfig:
    HIGH_CONFIDENCE_THRESHOLD = 0.85
    MEDIUM_CONFIDENCE_THRESHOLD = 0.70
    LOW_CONFIDENCE_THRESHOLD = 0.50
    MAX_IMAGE_SIZE = 10 * 1024 * 1024  # 10MB
    SUPPORTED_FORMATS = ['JPEG', 'PNG', 'GIF', 'BMP', 'WEBP']
```

### **Server Configuration**
- **Host**: `0.0.0.0` (all interfaces)
- **Port**: `8001` (configurable)
- **Reload**: Enabled for development
- **CORS**: Configured for frontend integration

## 🚀 **Production Deployment**

### **Environment Variables**
```bash
export MEDIVERIFY_HOST=0.0.0.0
export MEDIVERIFY_PORT=8001
export MEDIVERIFY_LOG_LEVEL=info
```

### **Docker Deployment** (Future)
```dockerfile
FROM python:3.11-slim
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . /app
WORKDIR /app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8001"]
```

### **Performance Considerations**
- **Async Operations**: All image processing is non-blocking
- **File Validation**: Early validation prevents unnecessary processing
- **Error Handling**: Comprehensive error responses
- **Memory Management**: Proper file cleanup after processing

## 🔮 **Future Enhancements**

### **Planned Features**
- [ ] Real AI/ML model integration
- [ ] Database integration for result storage
- [ ] User authentication and authorization
- [ ] Rate limiting and API keys
- [ ] Image preprocessing and optimization
- [ ] Batch verification endpoints
- [ ] Webhook notifications
- [ ] Analytics and reporting
- [ ] Model versioning and A/B testing

### **AI Model Improvements**
- [ ] Computer Vision model training
- [ ] Feature extraction algorithms
- [ ] Confidence calibration
- [ ] Ensemble methods
- [ ] Real-time model updates
- [ ] Custom training pipelines

### **Infrastructure**
- [ ] Redis caching
- [ ] PostgreSQL database
- [ ] Docker containerization
- [ ] Kubernetes deployment
- [ ] CI/CD pipelines
- [ ] Monitoring and logging
- [ ] Load balancing
- [ ] Auto-scaling

## 📊 **Monitoring & Logging**

### **Health Monitoring**
```bash
# Check if server is running
curl -f http://localhost:8001/health || echo "Server is down"
```

### **Log Files**
- **server.log**: Runtime logs and errors
- **access.log**: HTTP request logs (future)
- **error.log**: Application errors (future)

## 🤝 **API Integration**

### **Frontend Integration**
The API is designed to work seamlessly with the Flutter frontend:

```dart
// Frontend API call
final result = await ApiService.verifyMedicine(imageFile);

// Backend response automatically mapped to frontend format
{
  'is_genuine': result['is_authentic'],
  'confidence': result['confidence_score'],
  'issues_detected': result['issues_detected']
}
```

This backend provides a solid foundation for the MediVerify application with room for extensive enhancements and production deployment capabilities.