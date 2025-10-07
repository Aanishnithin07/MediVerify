# MediVerify

MediVerify is a reliable medical verification platform built with Flutter (frontend) and FastAPI (backend).

## Project Structure

```
MEDIVERIFY/
├── frontend/          # Flutter application
│   ├── lib/
│   │   ├── screens/   # UI screens
│   │   ├── widgets/   # Reusable widgets
│   │   ├── services/  # API services and business logic
│   │   └── main.dart  # App entry point
│   └── ...
├── backend/           # Python FastAPI backend
│   ├── main.py        # FastAPI application
│   ├── requirements.txt
│   ├── start.sh       # Startup script
│   └── .venv/         # Python virtual environment
└── README.md
```

## Color Palette

- **Primary (Trustworthy Green)**: `#27AE60`
- **Error (Warning Red)**: `#E74C3C`
- **Surface (Clean White)**: `#FFFFFF`
- **On Surface (Neutral Dark Grey)**: `#34495E`

## Getting Started

### Frontend (Flutter)

1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```

2. Get Flutter dependencies:
   ```bash
   flutter pub get
   ```

3. Run the Flutter app:
   ```bash
   flutter run
   ```

### Backend (FastAPI)

1. Navigate to the backend directory:
   ```bash
   cd backend
   ```

2. Activate the virtual environment:
   ```bash
   source .venv/bin/activate
   ```

3. Install dependencies (if not already installed):
   ```bash
   pip install -r requirements.txt
   ```

4. Start the FastAPI server:
   ```bash
   # Option 1: Using the startup script
   ./start.sh

   # Option 2: Using uvicorn directly
   uvicorn main:app --reload --host 0.0.0.0 --port 8000

   # Option 3: Using Python directly
   python main.py
   ```

5. Access the API:
   - API Root: http://localhost:8001
   - Health Check: http://localhost:8001/health
   - Medicine Verification: http://localhost:8001/verify (POST with image)
   - Model Info: http://localhost:8001/model-info
   - Interactive API Docs: http://localhost:8001/docs
   - ReDoc Documentation: http://localhost:8001/redoc

## API Endpoints

- `GET /` - Root endpoint with welcome message
- `GET /health` - Health check endpoint (returns `{"status": "ok"}`)
- `POST /verify` - Medicine verification endpoint (accepts image upload)
- `GET /model-info` - AI model information and capabilities

## Verification Response Format
```json
{
  "is_authentic": boolean,
  "confidence_score": float,
  "issues_detected": ["string"]
}
```

## Development

### Prerequisites

- Flutter SDK (latest stable version)
- Python 3.8+
- Dart SDK (included with Flutter)

### Frontend Development

The Flutter app uses Material Design 3 with a custom color scheme. The main components are:

- **HomeScreen**: Displays the MediVerify logo and welcome message
- **Material Design 3**: Modern, clean UI components
- **Custom Theme**: Uses the trustworthy green color palette

### Backend Development

The FastAPI backend provides a REST API with:

- **FastAPI Framework**: Modern, fast web framework for building APIs
- **CORS Support**: Configured to allow frontend connections
- **Auto-generated Documentation**: Available at `/docs` and `/redoc`
- **Health Check Endpoint**: For monitoring application status

## Next Steps

1. Add authentication and user management
2. Implement medical verification workflows
3. Add database integration
4. Create additional API endpoints
5. Enhance the Flutter UI with more screens and features
6. Add testing frameworks for both frontend and backend
7. Set up CI/CD pipelines
8. Add logging and monitoring

## License

This project is licensed under the MIT License.