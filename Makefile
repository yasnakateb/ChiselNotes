SBT = sbt

# Run the tests
led:
	$(SBT) "runMain chapter1.LEDMain"

operators:
	$(SBT) "runMain chapter2.OperatorsMain"

operators-test:
	$(SBT) "testOnly chapter2.OperatorsTest"

mux:
	$(SBT) "runMain chapter2.MultiplexerMain"

mux-test:
	$(SBT) "testOnly chapter2.MultiplexerTest"

clean:
	git clean -fd