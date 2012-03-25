package models;

import play.db.jpa.*;

import javax.persistence.*;

@Entity(name="web_place")
public class Place extends GenericModel{

  @Id @Column(name = "page_id")
  public Long id;

  @Column(name="d_title_est")
  public String title;


  public Place() {
  }

  public String toDisplayString() {
    return title;
  }

}
