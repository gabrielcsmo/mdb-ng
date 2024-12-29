COMPILER ?= g++
UNAME ?= $(shell uname)

SRCS = \
  dap.cpp \
  edbg.cpp \
  utils.cpp \
  target.cpp \
  target_atmel_cm0p.cpp \
  target_atmel_cm3.cpp \
  target_atmel_cm4.cpp \
  target_atmel_cm7.cpp \
  target_atmel_cm4v2.cpp \
  target_mchp_cm23.cpp

HDRS = \
  dap.h \
  dbg.h \
  edbg.h \
  utils.h \
  target.h

ifeq ($(UNAME), Linux)
  BIN = mdb-ng
  SRCS += dbg_lin.cpp
  LIBS += -ludev
else
  ifeq ($(UNAME), Darwin)
    BIN = mdb-ng
    SRCS += dbg_mac.cpp
    LIBS += -framework IOKit
    LIBS += -framework Foundation
    LIBS += -framework CoreFoundation
    LIBS += -framework Cocoa
  else
    BIN = mdb-ng.exe
    SRCS += dbg_win.cpp
    LIBS += -lhid -lwinusb -lsetupapi
  endif
endif

CWARNS = -Wno-write-strings -Wno-deprecated-enum-enum-conversion
CFLAGS += -W -Wall -Wextra -O3 -std=c++20 -fpermissive $(CWARNS)
#CFLAGS += -fno-diagnostics-show-caret

all: $(BIN)

$(BIN): $(SRCS) $(HDRS)
	$(COMPILER) $(CFLAGS) $(SRCS) $(LIBS) -o $(BIN)

clean:
	rm -rvf $(BIN)

