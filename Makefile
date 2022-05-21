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

alu:
	$(SBT) "runMain chapter4.ALUMain"

alu-test:
	$(SBT) "testOnly chapter4.ALUTest"

register:
	$(SBT) "runMain chapter4.RegisterMain"

register-test:
	$(SBT) "testOnly chapter4.RegisterTest"

count100:
	$(SBT) "runMain chapter4.Count100Main"

count100-test:
	$(SBT) "testOnly chapter4.Count100Test -- -DwriteVcd=1"

module-c:
	$(SBT) "runMain chapter4.ModuleCMain"

decoder:
	$(SBT) "runMain chapter5.DecoderMain"

pwm:
	$(SBT) "runMain chapter6.PWMMain"

pwm-test:
	$(SBT) "testOnly chapter6.PWMTest  -- -DwriteVcd=1"

clean:
	git clean -fd