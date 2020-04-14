.PHONY: test generate-tests clean-generate-tests

SWIFT_BIN := swift
SWIFT_VERISON := 5.0

SWIFT_OPTS := -Xswiftc -g
ifeq ($(SWIFT_VERISON),5.2)
SWIFT_OPTS += -cross-module-optimization
endif
SWIFT_TEST_OPTS := --enable-test-discovery


clean-generate-tests:
	rm -f Tests/LinuxMain.swift
	rm -f Tests/RollbarTests/XCTestManifests.swift

generate-tests: clean-generate-tests
	swift test --generate-linuxmain --enable-index-store --enable-test-discovery $(SWIFT_OPTS)

build:

build_debug:
	swift build $(SWIFT_OPTS) -c debug

debug:
	lldb --batch -o run -k "image list" -k "register read" -k "bt all" -k "exit 134" swift test $(SWIFT_TEST_OPTS) $(SWIFT_OPTS)

test: test_fast

test_all: test_thread test_address test_address_release

test_fast:
	swift test $(SWIFT_TEST_OPTS) $(SWIFT_OPTS)

test_thread:
	swift test $(SWIFT_TEST_OPTS) --sanitize=thread

test_address:
	swift test $(SWIFT_TEST_OPTS) --sanitize=address

test_address_release:
	swift test $(SWIFT_TEST_OPTS) --sanitize=address -c release -Xswiftc -enable-testing
