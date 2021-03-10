package GreenCommute;

        import com.intuit.karate.junit5.Karate;
        import com.intuit.karate.junit5.Karate.Test;

public class Runner {

    @Test
    public Karate testJob() {
        return Karate.run().relativeTo(getClass());
    }
}