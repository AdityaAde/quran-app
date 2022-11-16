# Aplikasi Al-Qur'an

Sebuah Aplikasi Al-Qur'an yang berisi surah yang ada dalam Al-Qur'an beserta terjemahan nya

## Requirement

1. Flutter minimum version 3.0.5
2. Editor seperti: Android Studio, IntelliJ Idea, VsCode

# CI-CD (Firebase)

This feature was created to make it easier for mobile developers.



## Requirements

download this Requirements and make sure you have experience to set global variable in system.

[NPM](https://nodejs.org/en/download/)

```bash
  C:\>npm --version
```

[Firebase CLI](https://firebase.google.com/docs/cli)

```bash
  C:\>firebase cli --version
```

[Ruby](https://rubyinstaller.org/)

```bash
  C:\>ruby --version
```


    
## Configuration & Deployment

Install and setup CUIT project

```bash
  git clone https://github.com/AdityaAde/quran-app.git
```

Go to the root-project directory

```bash
  cd android
```

Add Firebase Token on Fastfile

```bash
  firebase login:ci
```

Run automation

```bash
  bundle exec fastlane android_beta_app
```

Result

```bash
[17:41:23]: No authentication method specified. Using cached Firebase CLI credentials.
[17:41:23]: 🔐 Authenticated successfully.
[17:41:23]: ⌛ Uploading the APK.
[17:42:05]: ✅ Uploaded APK successfully and created release 1.1.2 (1).
[17:42:07]: ✅ Posted release notes.
[17:42:08]: ✅ Added testers/groups.
[17:42:08]: 🎉 App Distribution upload finished successfully.
```