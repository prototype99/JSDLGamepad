#!/bin/bash

set -euxo pipefail

: "-------------------------------------------------------------------- compile"
gcc -Wall -c \
  -I /usr/lib/jvm/java-11-openjdk/include -I /usr/lib/jvm/java-11-openjdk/include/linux \
  src/swig/JSDLGamepad_SwigInterface_wrap.c \
  -o bin/com/r6753/sdlgamepad/JSDLGamepad_SwigInterface.o \
  $(pkg-config --cflags --libs sdl2)
:

: "----------------------------------------------------------------------- link"
gcc -Wall -shared \
  /usr/lib/libSDL2.so \
  bin/com/r6753/sdlgamepad/JSDLGamepad_SwigInterface.o \
  -o bin/com/r6753/sdlgamepad/JSDLGamepad_SwigInterface.so \
  $(pkg-config --cflags --libs sdl2)

rm bin/com/r6753/sdlgamepad/JSDLGamepad_SwigInterface.o
:
