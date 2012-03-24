package controllers;

import controllers.securesocial.*;
import models.*;
import play.mvc.*;
import securesocial.provider.*;

import java.util.*;

@With(SecureSocial.class)
public class Application extends Controller {

  public static User getUser() {
    return (User)renderArgs.get("fanUser");
  }

  @Before
  public static void before() {
    FanUser fanUser = (FanUser)SecureSocial.getCurrentUser();
    if(fanUser != null) renderArgs.put("fanUser", User.findById(fanUser.userId));
  }

  public static void index() {
    SocialUser user = SecureSocial.getCurrentUser();
    List<Event> events = Event.find("time > ? and event_id != 0 order by time asc", new Date()).fetch();
    render(user, events);
  }

  /**
   * AJAX query endpoint for liking / disliking productions
   *
   * @param productionId
   * @param rating
   */
  public static void rateProduction(Long productionId, String rating) {
    EventRating eventRating = EventRating.find("web_event_id = ? and user_id = ?", productionId, getUser().id).first();

    if(eventRating != null) {
      eventRating.rating = EventRatings.valueOf(rating);
    } else {
      eventRating = new EventRating(getUser(), Production.<Production>findById(productionId), EventRatings.valueOf(rating));
    }
    eventRating.save();
    renderText("");
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
