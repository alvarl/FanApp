package controllers;

import controllers.securesocial.*;
import models.*;
import play.mvc.*;
import securesocial.provider.*;

import java.util.*;

@With(SecureSocial.class)
public class Application extends Controller {

  public static void index() {
    SocialUser user = SecureSocial.getCurrentUser();
    List<Event> events = Event.findAll();
    render(user, events);
  }

  public static void kava() {
    render();
  }
   public static void kava_ext() {
       render();
   }

   public static void points() {
       render();
   }

   public static void flowers() {
       render();
   }
}
