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

key-value:
	$(SBT) "runMain chapter2.KeyValueMain"

key-value-test:
	$(SBT) "testOnly chapter2.KeyValueTest"

register-file:
	$(SBT) "runMain chapter2.RegisterFileMain"

register-file-test:
	$(SBT) "testOnly chapter2.RegisterFileTest"

printf:
	$(SBT) "runMain chapter3.PrintfMain"

printf-test:
	$(SBT) "testOnly chapter3.PrintfTest"

clean:
	git clean -fd