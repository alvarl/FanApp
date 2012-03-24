package models;

import securesocial.provider.*;

public class FanUser extends SocialUser {
  public Long userId;

  public FanUser(Long userId) {
    this.userId = userId;
  }
}
