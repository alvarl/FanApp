package integration;

import models.User;
import org.junit.*;
import play.test.*;

public class UserTest extends UnitTest {

  @Before
  public void init() {
    Fixtures.deleteDatabase();
  }

  @Test
  public void userSaving() {
    User user = new User("a@b.e", "somePassword", "Joe User");
    user.save();

    user = User.find("byEmail", "a@b.e").first();
    assertEquals("a@b.e", user.email);
    assertEquals("somePassword", user.password);
    assertEquals("Joe User", user.fullName);
  }

  @Test
  public void authenticate() {
    Fixtures.loadModels("fixtures/user_bob.yml");
    User authenticated = User.authenticate("bob@gmail.com", "secret");
    assertEquals("Bob", authenticated.fullName);
  }

}
