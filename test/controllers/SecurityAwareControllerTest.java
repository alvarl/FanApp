package controllers;

import org.junit.Before;
import org.junit.Test;
import play.test.Fixtures;
import play.test.UnitTest;

public class SecurityAwareControllerTest extends UnitTest {

  @Before
  public void init() {
    Fixtures.deleteAllModels();
  }

  @Test
  public void authenticate() {
    Fixtures.loadModels("fixtures/user_bob.yml");
    assertTrue(SecurityAwareController.Security.authenticate("bob@gmail.com", "secret"));

    assertFalse(SecurityAwareController.Security.authenticate("bob@gmail.com", "wrongpassword"));

    assertFalse(SecurityAwareController.Security.authenticate("john@gmail.com", "somepassword"));

  }
}
