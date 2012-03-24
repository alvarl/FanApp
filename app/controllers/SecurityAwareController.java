package controllers;

import models.Category;
import models.DynamicCategory;
import models.User;
import play.mvc.Before;
import play.mvc.Controller;

public class SecurityAwareController extends Controller {
  @Before
  public static void initializeUserInSession() {
    User user = getCurrentUser();
    renderArgs.put("user", user);
    renderArgs.put("authenticated", user != null);
    renderArgs.put("categories", Category.find("byOwner", user).fetch());
    renderArgs.put("dynamicCategories", DynamicCategory.list());
  }

  public static User getCurrentUser() {
    String username = Secure.Security.connected();
    if (username == null) return null;
    User user = User.find("byEmail", username).first();
    return user;
  }

  public static class Security extends Secure.Security {
    static boolean authenticate(String username, String password) {
      User u = User.authenticate(username, password);
      if (u != null && !u.isActivated()) {
        flash.put("authError", "secure.notActivated");
        flash.put("email", username);
      }
      return u != null && u.isActivated();
    }
  }
}
