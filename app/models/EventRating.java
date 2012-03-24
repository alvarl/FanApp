package models;

import play.db.jpa.*;

import javax.persistence.*;

import static javax.persistence.EnumType.STRING;

@Entity(name = "fan_event_rating")
public class EventRating extends Model {
  @ManyToOne(optional = false)
  public User user;

  @ManyToOne(optional = false)
  Production production;
  
  @Enumerated(value = STRING)
  public EventRatings rating;

  public EventRating(User user, Production production, EventRatings rating) {
    this.user = user;
    this.production = production;
    this.rating = rating;
  }
}
