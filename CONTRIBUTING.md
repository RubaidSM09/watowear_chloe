# Contributing — local Flutter version (FVM)

This project pins a Flutter SDK version using FVM to avoid global SDK upgrades.

Quick start for contributors:

1. Install FVM (one-time):

```powershell
# via Dart pub
dart pub global activate fvm
# or via Chocolatey
choco install fvm
```

2. From the repo root run:

```powershell
# install the pinned SDK and set it for this project
fvm install
fvm use
# then fetch packages
fvm flutter pub get
```

3. Use `fvm flutter` for commands to keep your global SDK unchanged:

```powershell
fvm flutter run
fvm flutter build apk
```

Notes:
- The repository commits `.fvm/fvm_config.json` which pins the version — do not modify it without discussion.
- The actual SDK is stored in your local FVM cache (`%USERPROFILE%\\fvm`), not in the repo.
- The repo `.gitignore` already ignores `.fvm/` to avoid committing the SDK.

CI: ensure your CI runs `fvm install` before builds.
