package models;

import play.db.jpa.*;

import javax.persistence.*;
import java.util.*;

@Entity(name = "web_event")
public class Production extends GenericModel {
  @Id @Column(name = "page_id")
  public Long id;
  @Column(name = "d_title_est")
  public String title;
  @Column(name = "d_intro_est")
  public String intro;
  @OneToMany
  public List<Event> events;

  @Column(name="d_pagetitle")
  public String noNumber;

  @Column(name="photo")
  public String imageName;

  @Column(name="d_content_est")
  public String content;

  public Production() {
  }

  // Todo Refactor
  public String getTitle() {
    return title.replaceAll("Ã¤","ä")
      .replaceAll("Ãµ","õ")
      .replaceAll("Ã©","é");
  }
}
