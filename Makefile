CRYSTAL_BIN ?= $(shell which crystal)
SHARDS_BIN ?= $(shell which shards)
PREFIX ?= /usr/local
SHARD_BIN ?= ../../bin

build: bin/exec_from
bin/exec_from:
	$(SHARDS_BIN) build $(CRFLAGS)
clean:
	rm -f ./bin/exec_from ./bin/exec_from.dwarf
install: build
	mkdir -p $(PREFIX)/bin
	cp ./bin/exec_from $(PREFIX)/bin
bin: build
	mkdir -p $(SHARD_BIN)
	cp ./bin/exec_from $(SHARD_BIN)
run_file:
	cp -n ./bin/exec_from $(SHARD_BIN) || true
test: build
	$(CRYSTAL_BIN) spec
