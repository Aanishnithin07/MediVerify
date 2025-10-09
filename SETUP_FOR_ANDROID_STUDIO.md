# MediVerify Setup Guide for Android Studio Users

## 📱 **Quick Setup for Your Friend with Android Studio**

### ✅ **Prerequisites Check**
- ✅ Android Studio installed
- ✅ Git installed
- ✅ Flutter SDK (will install if needed)

---

## 🚀 **Step-by-Step Setup**

### **Step 1: Clone the Repository**
```bash
git clone https://github.com/Aanishnithin07/MediVerify.git
cd MediVerify
```

### **Step 2: Install Flutter SDK (if not installed)**
```bash
# Download Flutter SDK
cd ~/
git clone https://github.com/flutter/flutter.git -b stable

# Add to PATH (add this to ~/.zshrc or ~/.bash_profile)
export PATH="$PATH:$HOME/flutter/bin"

# Reload shell
source ~/.zshrc  # or source ~/.bash_profile
```

### **Step 3: Verify Flutter Installation**
```bash
flutter doctor
```
**Expected output should show:**
- ✅ Flutter SDK
- ✅ Android toolchain (Android Studio)
- ✅ Android Studio
- ⚠️ Other platforms (iOS/web) - not needed for Android

### **Step 4: Setup Android Device/Emulator**

**Option A: Physical Android Device**
1. Enable Developer Options on your Android phone
2. Enable USB Debugging
3. Connect via USB
4. Run: `flutter devices` (should show your device)

**Option B: Android Emulator**
1. Open Android Studio
2. Go to Tools → AVD Manager
3. Create Virtual Device → Choose any recent phone
4. Download system image (API 30+ recommended)
5. Start the emulator

### **Step 5: Run the Backend Server**
```bash
# Navigate to backend directory
cd MediVerify/backend

# Install Python dependencies (if Python not available, install Python 3.8+)
python3 -m pip install -r requirements.txt

# Start the backend server
python3 main.py
```
**✅ Backend should start on:** http://localhost:8001

### **Step 6: Run the Flutter App**
```bash
# Navigate to frontend directory
cd ../frontend

# Get Flutter dependencies
flutter pub get

# Run the app (with emulator/device connected)
flutter run

# Or specifically for Android:
flutter run -d android
```

---

## 🎯 **Expected Results**

### **Backend Running:**
- Server at: http://localhost:8001
- Health check: http://localhost:8001/health
- API docs: http://localhost:8001/docs

### **Flutter App Features:**
1. **Beautiful home screen** with MediVerify logo
2. **Animated scan button** that pulses
3. **Camera integration** for taking medicine photos
4. **Loading screen** with rotating animations
5. **Result screen** showing verification results
   - Green background for genuine medicines
   - Red background for counterfeits
   - Confidence scores and issue detection

---

## 🛠 **Troubleshooting**

### **Common Issues & Solutions:**

**1. Flutter not recognized:**
```bash
# Make sure Flutter is in PATH
echo $PATH | grep flutter
# If not found, add to ~/.zshrc:
export PATH="$PATH:$HOME/flutter/bin"
```

**2. Android license issues:**
```bash
flutter doctor --android-licenses
# Accept all licenses
```

**3. Backend connection issues:**
- Make sure backend is running on port 8001
- Check if `http://localhost:8001/health` returns `{"status":"ok"}`
- Firewall might be blocking - temporarily disable or allow port 8001

**4. Camera permissions:**
- Android: Permissions are handled automatically by Flutter
- If issues persist, check app settings and grant camera permission manually

**5. Build errors:**
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter run
```

---

## 📱 **Testing the App**

1. **Tap the scan button** - should open camera
2. **Take a photo** - should show loading screen
3. **View results** - should show verification result with animations
4. **Navigate back** - should return to home screen smoothly

---

## 🎨 **App Features to Test**

### **Animations:**
- Logo entrance animation on home screen
- Pulsing scan button
- Loading screen with rotating medical icon
- Result screen with slide-in animations
- Smooth navigation transitions

### **Functionality:**
- Camera integration (photo capture)
- API communication with backend
- Result display (genuine/counterfeit detection)
- Error handling (network issues, camera issues)

---

## 📞 **Support**

If any issues arise:
1. Check `flutter doctor` output
2. Verify backend is running (`curl http://localhost:8001/health`)
3. Check Android device/emulator is detected (`flutter devices`)
4. Review error messages in terminal

**Repository:** https://github.com/Aanishnithin07/MediVerify.git
**Backend Port:** 8001
**Frontend:** Flutter with Material Design 3

---

## 🚀 **Quick Test Commands**

```bash
# Quick health checks
flutter doctor
flutter devices
curl http://localhost:8001/health

# Quick run
cd MediVerify/backend && python3 main.py &
cd ../frontend && flutter run
```

**Expected result:** Beautiful medicine verification app running on Android! 📱✨