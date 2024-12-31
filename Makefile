COMPILER ?= g++
UNAME ?= $(shell uname)

SRCS = \
  src/main.cpp \
  src/dap.cpp \
  src/utils.cpp \
  src/target.cpp \
  src/target_atmel_cm0p.cpp \
  src/target_atmel_cm3.cpp \
  src/target_atmel_cm4.cpp \
  src/target_atmel_cm7.cpp \
  src/target_atmel_cm4v2.cpp \
  src/target_mchp_cm23.cpp

HDRS = \
  inc/dap.h \
  inc/dbg.h \
  inc/edbg.h \
  inc/utils.h \
  inc/target.h

ifeq ($(UNAME), Linux)
  BIN = mdb-ng
  SRCS += src/linux/dbg.cpp
  LIBS += -ludev
else
  ifeq ($(UNAME), Darwin)
    BIN = mdb-ng
    SRCS += src/osx/dbg.cpp
    LIBS += -framework IOKit
    LIBS += -framework Foundation
    LIBS += -framework CoreFoundation
    LIBS += -framework Cocoa
  else
    BIN = mdb-ng.exe
    SRCS += src/windows/dbg.cpp
    LIBS += -lhid -lwinusb -lsetupapi
  endif
endif

CWARNS = -Wno-write-strings
CFLAGS += -W -Wall -Wextra -O3 -std=c++20 -fpermissive $(CWARNS)
#CFLAGS += -fno-diagnostics-show-caret

all: $(BIN)

$(BIN): $(SRCS) $(HDRS)
	$(COMPILER) $(CFLAGS) $(SRCS) $(LIBS) -o $(BIN) -Iinc

clean:
	rm -rvf $(BIN)

