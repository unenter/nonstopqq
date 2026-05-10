#!/bin/sh

if [ "$(uname -m)" = "aarch64" ];then
  if [ "$ENABLE_DISABLE_GPU" = "true" ]; then
    /opt/QQ/qq --disable-gpu-sandbox --no-sandbox --disable-gpu
  else
    /opt/QQ/qq --disable-gpu-sandbox --no-sandbox
  fi
else
  if [ "$ENABLE_DISABLE_GPU" = "true" ]; then
    /opt/QQ/qq --no-sandbox --disable-gpu
  else
    /opt/QQ/qq --no-sandbox
  fi
fi