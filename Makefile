SHELL   = /bin/sh
CC      = gcc

CFLAGS  += -pedantic -Wall -O3 -ffast-math -finline-functions
LFLAGS = -lm $(LDFLAGS)

TARGET  = aragorn
SOURCES = $(shell echo *.c)
HEADERS = $(shell echo *.h)
OBJECTS = $(SOURCES:.c=.o)

EMPTY         =
PANDOC        = pandoc
PREFIX        = /usr/local
INSTALLDIR    = $(PREFIX)/bin
INSTALLMANDIR = $(PREFIX)/share/man/man1

all: $(TARGET) doc

doc: $(TARGET).1

$(TARGET).1:
ifeq ($(EMPTY), $(shell which $(PANDOC) 2>/dev/null))
	@echo "Failed to find $(PANDOC), no documentation"
else
	$(PANDOC) -s -V title=$(TARGET) -t man -f markdown -o $(TARGET).1 README.md
endif

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(LFLAGS)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c -o $@ $<

install: $(TARGET)
	install -d -m 0755 $(INSTALLDIR)
	install -m 0755 $(TARGET) $(INSTALLDIR)
	install -d -m 755 $(INSTALLMANDIR)
	install $(TARGET).1 $(INSTALLMANDIR)
 
uninstall:
	-rm $(INSTALLDIR)/$(TARGET)
	-rm $(INSTALLMANDIR)/$(TARGET).1

clean:
	-rm -f $(OBJECTS)

distclean: clean
	-rm -f $(TARGET) $(TARGET).1

.PHONY: all install uninstall clean distclean
