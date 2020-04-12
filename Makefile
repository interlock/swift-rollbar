.PHONY: test generate-tests clean-generate-tests

clean-generate-tests:
	rm -f Tests/LinuxMain.swift
	rm -f Tests/RollbarTests/XCTestManifests.swift

generate-tests: clean-generate-tests
	swift test --generate-linuxmain --enable-index-store --enable-test-discovery

test: generate-tests
	swift test