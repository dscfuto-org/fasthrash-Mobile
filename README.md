# How to Pull a Flutter Project from GitHub and Build it on Your Machine

This guide will walk you through the steps of pulling a Flutter project from a GitHub repository, building it on your local machine, and generating the APK and IPA files for installation on an Android or iOS device.

## Prerequisites
Before proceeding with the steps below, you must have the following installed on your machine:

- Flutter SDK
- Android Studio (for Android development)
- Xcode (for iOS development)

## Steps

1. Clone the GitHub repository.

```git clone https://github.com/dscfuto-org/fasthrash-Mobile.git```

Replace username and repository-name with the respective username and repository name of the project you want to clone.

2. Navigate to the project directory.
   ```cd fasthrash-Mobile```

Replace repository-name with the name of the repository you just cloned.

3. Install the project dependencies.

```flutter pub get```

4. Connect your Android or iOS device to your machine using a USB cable and ensure that USB debugging is enabled on your device.

5. To build and install the app on your Android device, run:

```flutter run --release --no-codesign```

Note that you must have a valid Apple Developer account and a provisioning profile to build and install the app on an iOS device.


6. To generate the APK file for Android installation, run:

```flutter build apk```

The APK file will be located in the build/app/outputs/flutter-apk directory.

7. To generate the IPA file for iOS installation, run:

```flutter build ios --release --no-codesign```

The IPA file will be located in the build/ios/archive/ directory.

Congratulations! You have successfully pulled a Flutter project from GitHub, built it on your machine, and generated the APK and IPA files for installation on Android and iOS devices, respectively.

## Hot credentials
### User account
`Email:` solutionchallenge@gmail.com
`Password:` 4%VgyBFXq/6G$xyz

### Collector account
`Email:` gdscsolutionchallenge@gmail.com
`Password:` pcKD?c2w@;9\"-@m
