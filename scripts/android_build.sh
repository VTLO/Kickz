#!/bin/bash

# Builds the ChowKick standalone app for Android (APK).
#
# Requirements: JDK 17+, Android SDK (ANDROID_HOME / ANDROID_SDK_ROOT) with
# NDK 25.2.9519653 and CMake 3.22.1, and the host packages needed to build
# JUCE's juceaide helper (see .github/workflows/android.yml).
#
# Usage: bash scripts/android_build.sh [gradle task] [extra gradle args...]
#        (default task: assembleRelease)

set -e

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(dirname "$script_dir")"

# Apply Android compatibility patches to submodules (idempotent)
apply_patch() {
    local submodule="$1"
    local patch="$2"

    if git -C "$repo_root/$submodule" apply --reverse --check "$patch" 2> /dev/null; then
        echo "Patch $(basename "$patch") already applied to $submodule"
    else
        echo "Applying $(basename "$patch") to $submodule"
        git -C "$repo_root/$submodule" apply "$patch"
    fi
}

apply_patch modules/chowdsp_utils "$repo_root/android/patches/chowdsp_utils.patch"

task="${1:-assembleRelease}"
shift || true

cd "$repo_root/android"
./gradlew --no-daemon "$task" "$@"
