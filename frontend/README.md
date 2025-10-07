# MediVerify Frontend

A beautifully designed Flutter application for medical verification with stunning animations and user experience.

## Features

### ✨ **Stunning Home Screen**
- **Clean, Modern Design**: Gradient background with Material Design 3
- **Animated Logo**: Elastic entrance animation with scaling effects
- **Interactive Scan Button**: Circular button with pulse animation and tactile feedback
- **Smooth Transitions**: Slide and fade animations for all text elements
- **Reassuring Tagline**: "Certainty in the palm of your hand"

### 📱 **Camera & Verification Flow**
- **Seamless Camera Integration**: One-tap photo capture
- **Loading Animation**: Beautiful rotating medical icon with progress dots
- **Real-time Processing**: Connects to backend `/verify` endpoint
- **Error Handling**: Graceful error states with user-friendly messages

### 🎨 **Mind-Blowing Result Screen**
- **Dynamic Backgrounds**:
  - **Genuine**: Reassuring green gradient with animated checkmark
  - **Counterfeit**: Cautionary red gradient with animated warning X
- **Animated Icons**: Elastic scaling and rotation effects
- **Confidence Display**: Clear percentage with analytics icon
- **Issue Detection**: Detailed list of problems for counterfeit medicines
- **Smooth Navigation**: Return to home with elegant transitions

## Quick Start

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run
```

## Architecture

### 📁 **Project Structure**
```
lib/
├── screens/
│   ├── home_screen.dart        # Main landing page with scan button
│   └── result_screen.dart      # Verification results display
├── widgets/
│   ├── animated_scan_button.dart  # Custom animated camera button
│   └── loading_screen.dart     # Loading animation widget
├── services/
│   ├── api_service.dart        # Backend communication
│   └── camera_service.dart     # Camera and image handling
└── main.dart                   # App entry point with theme
```

### 🎨 **Design System**

#### Color Palette
- **Primary Green**: `#27AE60` - Trust and reliability
- **Secondary Green**: `#2ECC71` - Success states
- **Warning Red**: `#E74C3C` - Danger and alerts
- **Dark Grey**: `#34495E` - Text and UI elements
- **Clean White**: `#FFFFFF` - Backgrounds and contrast

## Key Features

### 🔘 **Animated Scan Button**
- Continuous pulse animation when idle
- Press animation with scale effect
- Loading state with spinner
- Camera icon with scaling animation

### 📊 **Result Screens**
- **Genuine**: Green gradient with animated checkmark
- **Counterfeit**: Red gradient with animated warning X
- Confidence scores and detailed issue detection

For detailed documentation, see the full project README.
