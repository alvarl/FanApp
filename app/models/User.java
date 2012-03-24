package models;

import play.db.jpa.*;

import javax.persistence.*;

@Entity(name = "fan_user")
public class User extends Model {

  public String name;
  public String email;
  public String phone;

  public User() {

  }


}
