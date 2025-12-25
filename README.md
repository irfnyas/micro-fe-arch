# microfearch

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application (3.38.5).

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Flashlight Command

```bash
# Run test
flashlight test --bundleId "app.irfnyas.microfearch" \            
  --testCommand "adb shell monkey -p app.irfnyas.microfearch  -c android.intent.category.LAUNCHER 1" \
  --duration 20000 --iterationCount 1 --record

# Native report
flashlight report ./results_native.json

# Web report
flashlight report ./results_web.json
```