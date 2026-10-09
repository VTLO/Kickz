# ChowKick

![CI](https://github.com/Chowdhury-DSP/ChowKick/workflows/CI/badge.svg)
[![License](https://img.shields.io/badge/License-BSD-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Downloads](https://img.shields.io/github/downloads/Chowdhury-DSP/ChowKick/total)](https://somsubhra.github.io/github-release-stats/?username=Chowdhury-DSP&repository=ChowKick&page=1&per_page=30)

**ChowKick** is a kick drum synthesizer plugin based on 
creative modelling of old-school drum machine circuits.
MIDI input to the plugin triggers a pulse with a
parameterized size and shape. The pulse is then passed
into a resonant filter which can be tuned to a specific
frequency, or matched to the frequency of the incoming
MIDI notes.

### Quick Links:
- [Latest Release](https://chowdsp.com/products.html#kick)
- [ChowKick for iOS](https://apps.apple.com/us/app/chowkick/id1567842112)
- [Nightly Builds](https://chowdsp.com/nightly.html#kick)
- [User Manual](https://chowdsp.com/manuals/ChowKickManual.pdf)

![](./manual/screenshots/full_gui.png)

## Building

To build from scratch, you must have CMake installed.

```bash
# Clone the repository
$ git clone https://github.com/Chowdhury-DSP/ChowKick.git
$ cd ChowKick

# initialize and set up submodules
$ git submodule update --init --recursive

# build with CMake
$ cmake -Bbuild
$ cmake --build build --config Release
```
The resulting builds can be found in `build/ChowKick_artefacts`.

### Android

The standalone app can be built as an Android APK with the Gradle project in `android/`.
You'll need JDK 17+, the Android SDK (with `ANDROID_HOME` set), NDK `25.2.9519653`, and the
SDK's CMake `3.22.1`, plus the usual JUCE Linux development packages (used to build JUCE's
host-side helper tool).

```bash
# applies Android compatibility patches to the submodules, then runs Gradle
$ bash scripts/android_build.sh assembleRelease
```
The APK can be found in `android/app/build/outputs/apk/release`. The `CI-Android` GitHub
workflow builds the same APK and uploads it as a build artifact.

## Credits

- GUI Framework - [Plugin GUI Magic](https://github.com/ffAudio/PluginGUIMagic)
- SIMD functions - [XSIMD](https://github.com/xtensor-stack/xsimd)
- Tuning Support - [Tuning Library](https://github.com/surge-synthesizer/tuning-library) from the [Surge Synthesizer Team](https://surge-synthesizer.github.io/)

This plugin was inspired by Kurt Werner's analysis and
modelling of the TR-808 Kick Drum Circuit, discussed
in his wonderful [PhD Dissertation](https://stacks.stanford.edu/file/druid:jy057cz8322/KurtJamesWernerDissertation-augmented.pdf).

## License

ChowKick is open source, and is licensed under the BSD 3-clause license.
Enjoy!
