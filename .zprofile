export PATH=~/bin:$PATH
export NDK_VERSION=27.1.12297006


if [[ "$OSTYPE" == darwin* ]]; then
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk

# Some tools and compilation scripts use either of these
# That's why there is two
export ANDROID_NDK_HOME=$ANDROID_SDK_ROOT/ndk/$NDK_VERSION
export ANDROID_NDK_ROOT=$ANDROID_SDK_ROOT/ndk/$NDK_VERSION
# export NDK_HOME=$ANDROID_SDK_ROOT/ndk/$NDK_VERSION

export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
# export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jbr/Contents/Home
else
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_NDK_HOME=$ANDROID_SDK_ROOT/ndk/$NDK_VERSION
export ANDROID_NDK_ROOT=$ANDROID_SDK_ROOT/ndk/$NDK_VERSION
export NDK_HOME=$ANDROID_HOME/ndk/$NDK_VERSION
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
fi