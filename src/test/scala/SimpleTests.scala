import org.scalatest.funsuite.AnyFunSuite

class SimpleTests extends AnyFunSuite {

    // test 1
    test("the name is set correctly in constructor") {
        val p = new Person("Barney Rubble")
        assert(p.name == "Barney Rubble")
    }

    // test 2
    test("a Person's name can be changed") {
        val p = new Person("Chad Johnson")
        p.name = "Ochocinco"
        assert(p.name == "Ochocinco")
    }

}