package controllers;

import controllers.securesocial.*;
import play.mvc.*;
import securesocial.provider.*;

@With(SecureSocial.class)
public class Application extends Controller {

  public static void index() {
    SocialUser user = SecureSocial.getCurrentUser();
    render(user);
  }

}
