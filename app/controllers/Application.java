package controllers;

import controllers.securesocial.*;
import models.*;
import play.data.validation.*;
import play.i18n.*;
import play.mvc.*;
import securesocial.provider.*;

import java.util.*;

@With(SecureSocial.class)
public class Application extends Controller {

  // List of rewards for flowers
  public static Map<Integer,Reward> rewards = new HashMap<Integer, Reward>();

  static {
    rewards.put(1, new Reward("Small flower", 5));
    rewards.put(2, new Reward("Medium flower", 10));
    rewards.put(3, new Reward("Large flower", 15));
  }



  public static User getUser() {
    return (User)renderArgs.get("fanUser");
  }

  @Before
  public static void before() {
    FanUser fanUser = (FanUser)SecureSocial.getCurrentUser();
    if (fanUser != null) renderArgs.put("fanUser", User.findById(fanUser.userId));
  }

  public static void index() {
    render();
  }

  /**
   * AJAX query endpoint for liking / disliking productions
   *
   * @param productionId
   * @param rating
   */
  public static void rateProduction(Long productionId, String rating) {
    EventRating eventRating = EventRating.find("web_event_id = ? and user_id = ?", productionId, getUser().id).first();

    if (eventRating != null) {
      eventRating.rating = EventRatings.valueOf(rating);
    }
    else {
      eventRating = new EventRating(getUser(), Production.<Production>findById(productionId), EventRatings.valueOf(rating));
    }
    eventRating.save();
    renderText("");
  }

  public static void buyTicket(Long eventId, Integer count) {
    Event event = Event.findById(eventId);
    try {
      TicketPurchase ticket = TicketPurchase.register(event, getUser(), count == null ? 1 : count);
      renderTemplate("Application/ticket.html", ticket);
    }
    catch (OutOfTicketsException e) {
      error(400, Messages.get("Not enough tickets!"));
    }
    catch (OutOfPointsException e) {
      error(400, Messages.get("Not enough points!"));
    }
    error(500, "An error occurred while buying the ticket");
  }

  public static void patActor(int actorId, int rewardId, String description) {
    try {
      Actor a = createActors().get(actorId);
      Reward r = rewards.get(rewardId);
      if(a == null || r == null) {
        flash.error("Please fill all fields");
      } else {
        try {
          ActorPatting.register(getUser(), r.points, Messages.get("Saaja") + ": " + a.name + " / " + Messages.get("Teade") + ": " + description);
          flash.success("Big thanks, the flowers have been sent!");
        }
        catch (OutOfPointsException e) {
          flash.error("Not enough points!");
        }
      }
    }
    catch (Exception e) {
      flash.error("Technical issue");
      System.out.println(e);
    }
    flowers();
  }

  public static void supportTheatre() {
    try {
      PointTransaction.register(getUser(), 1, Messages.get("Support the theatre"));
    }
    catch (OutOfPointsException e) {
      error(Messages.get("Not enough points!"));
    }
    renderText("OK");
  }

  public static void kava() {
    SocialUser user = SecureSocial.getCurrentUser();
    List<Event> events = Event.find("time > ? and event_id != 0 order by time asc", new Date()).fetch();
    render(user, events);
  }

  public static void kava_ext(@Required Long eventId) {
    if(!Validation.hasErrors()) {
      Event event = Event.findById(eventId);
      Production production = event.production;
      render(event, production);
    } else {
      error(400,"Invalid ID");
    }
  }

  public static void account() {
    User user = getUser();
    render(user);
  }

  public static void support() {

    render();
  }

  public static void flowers() {
    Map<Integer, Reward> rewards = Application.rewards;
    Map<Integer, Actor> actors = createActors();
    render(rewards,actors);
  }

  private static Map<Integer, Actor> createActors() {
    Map<Integer, Actor> actors = new HashMap<Integer, Actor>();
    actors.put(1,new Actor("Rasmus Kaljujärv"));
    actors.put(2,new Actor("Eve Klemets"));
    actors.put(3,new Actor("Risto Kübar"));
    actors.put(4,new Actor("Mirtel Pohla"));
    actors.put(5,new Actor("Jaak Prints"));
    actors.put(6,new Actor("Gert Raudsepp"));
    actors.put(7,new Actor("Inga Salurand"));
    actors.put(8,new Actor("Tambet Tuisk"));
    actors.put(9,new Actor("Marika Vaarik"));
    actors.put(10,new Actor("Sergo Vares"));
    return actors;
  }

  public static void savePreferences(boolean offersAllowed) {
    User user = getUser();
    if (user == null) {
      error(400,"No user");
      return;
    }

    user.offersAllowed = offersAllowed;

    try {
      user.save();
    } catch (Exception e) {
      error(400,"Cannot save");
      return;
    }
    flash.success("Saved!");
    account();
  }
}
