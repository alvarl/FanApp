package models;

import play.db.jpa.*;

import javax.persistence.*;
import java.util.*;

@Entity(name = "fan_actor_patting")
public class ActorPatting extends Model {
  @ManyToOne(optional = false)
  public User user;
  public int points;
  public String description;
  @Column(name = "bought_at")
  public Date boughtAt;

  public ActorPatting(User user, int points, String description) {
    this.user = user;
    this.points = points;
    this.description = description;
  }

  public static void register(User user, int points, String description) throws OutOfPointsException {
    PointTransaction.register(user, points, description);
    new ActorPatting(user, points, description).save();
  }
}
