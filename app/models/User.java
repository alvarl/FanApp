package models;

import play.db.jpa.*;

import javax.persistence.*;
import java.util.*;

@Entity(name = "fan_user")
public class User extends Model {

  public String name;
  public String email;
  public String phone;
  public int points;

  @OneToMany
  @JoinColumn(name = "user_id")
  @MapKeyColumn(name = "web_show_id")
  public Map<Long, TicketPurchase> ticketPurchases;

  @OneToMany
  @JoinColumn(name = "user_id")
  @MapKeyColumn(name = "web_event_id")
  public Map<Long, EventRating> ratings;

  public User() {
  }

  public Map<Long, EventRating> getRatings() {
    return ratings;
  }

  public Map<Long, TicketPurchase> getTicketPurchases() {
    return ticketPurchases;
  }

  public EventRatings getRatingFor(Long productionId) {
    EventRating eventRating = getRatings().get(productionId);
    return eventRating == null ? null : eventRating.rating;
  }

  public TicketPurchase getTicketFor(Long eventId) {
    return getTicketPurchases().get(eventId);
  }
}
