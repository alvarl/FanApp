package models;

import play.db.jpa.*;

import javax.persistence.*;
import java.util.*;

@Entity(name = "fan_point_transaction")
public class PointTransaction extends Model {
  @ManyToOne(optional = false)
  public User user;
  public int points;
  public String description;
  @Column(name = "made_at")
  public Date madeAt;

  public PointTransaction(User user, int points, String description) {
    this.user = user;
    this.points = points;
    this.description = description;
  }

  public static void register(User user, int points, String description) throws OutOfPointsException {
    if(user.points < points) throw new OutOfPointsException();
    user.points -= points;
    user.save();
    PointTransaction t = new PointTransaction(user, points, description);
    t.save();
  }
}
