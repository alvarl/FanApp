package models;

import play.db.jpa.*;

import javax.persistence.*;

@Entity(name = "web_event")
public class Event extends GenericModel {
  @Id @Column(name = "page_id")
  public Long id;
  @Column(name = "d_title_est")
  public String title;
  @Column(name = "d_intro_est")
  public String intro;
}
