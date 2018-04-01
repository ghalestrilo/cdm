export LIBRARY_PATH=/home/thales/Desktop/thales/lib/crsfml/voidcsfml
export LD_LIBRARY_PATH=$(LIBRARY_PATH)

BINDIR   = bin
EXECNAME = test

SRCDIR = src
BIN = $(BINDIR)/$(EXECNAME)


all: run

run:
	crystal $(SRCDIR)/main.cr

build:
	crystal build $(SRCDIR)/main.cr --static -o $(BIN)
