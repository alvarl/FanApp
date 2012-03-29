package models;

import play.db.jpa.*;

import javax.persistence.*;
import java.util.*;

@Entity(name = "web_event")
public class Production extends GenericModel {
  @Id @Column(name = "page_id")
  public Long id;
  @Column(name = "d_title_eng")
  public String title;
  @Column(name = "d_intro_eng")
  public String intro;
  @OneToMany
  public List<Event> events;

  @Column(name="d_pagetitle")
  public String noNumber;

  @Column(name="photo")
  public String imageName;

  @Column(name="d_content_eng")
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
