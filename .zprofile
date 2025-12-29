export PATH=~/bin:$PATH

export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

export NDK_VERSION=26.1.10909125
# ANDROID_NDK_HOME is used by cargo-ndk to find the NDK and set the environment variables
export ANDROID_NDK_HOME=$ANDROID_SDK_ROOT/ndk/$NDK_VERSION
# ANDROID_NDK_ROOT seems to be other scripts/crates way to compile for Android
export ANDROID_NDK_ROOT=$ANDROID_SDK_ROOT/ndk/$NDK_VERSION

export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
# export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home