SBT = sbt

# Run the tests
led:
	$(SBT) "runMain chapter1.LEDMain"


clean:
	git clean -fd