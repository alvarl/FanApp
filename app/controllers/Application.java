package controllers;

import controllers.securesocial.*;
import models.*;
import play.mvc.*;
import securesocial.provider.*;

import java.util.*;

@With(SecureSocial.class)
public class Application extends Controller {

  @Before
  public static void before() {
    FanUser fanUser = (FanUser)SecureSocial.getCurrentUser();
    if(fanUser != null) renderArgs.put("fanUser", User.findById(fanUser.userId));
  }

  public static void index() {
    SocialUser user = SecureSocial.getCurrentUser();
    List<Event> events = Event.findAll();
    render(user, events);
  }


}
