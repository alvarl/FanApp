package models;

import play.db.jpa.*;

import javax.persistence.*;
import java.util.*;

@Entity(name = "fan_user")
public class User extends Model {

  public String name;
  public String email;
  public String phone;

  @OneToMany
  @JoinColumn(name = "id")
  public List<EventRating> ratings;

  public User() {

  }
}
