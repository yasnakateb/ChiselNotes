SBT = sbt

# Run the tests
led:
	$(SBT) "runMain chapter1.LEDMain"

datatypes:
	$(SBT) "runMain chapter2.data_types.DataTypesMain"


clean:
	git clean -fd