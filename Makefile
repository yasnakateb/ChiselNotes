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

counter:
	$(SBT) "runMain chapter2.MyCounterMain"

counter-test:
	$(SBT) "testOnly chapter2.MyCounterTest -- -DwriteVcd=1"

clean:
	git clean -fd