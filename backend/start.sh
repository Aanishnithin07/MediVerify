#!/bin/bash

# MediVerify Backend Startup Script

echo "Starting MediVerify Backend..."

# Activate virtual environment and start the server
source .venv/bin/activate
uvicorn main:app --reload --host 0.0.0.0 --port 8000