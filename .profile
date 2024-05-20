# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi



eval `ssh-agent`
ssh-add /data/setstack/ben

export ANDROID_SDK_ROOT=/root/Android/Sdk/
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator/
export PATH=/opt/gradle/gradle-7.4.2/bin:$PATH

mesg n 2> /dev/null || true
