package models;

import play.db.jpa.*;
import securesocial.provider.*;

import javax.persistence.*;
import java.io.*;

import static javax.persistence.EnumType.STRING;

@Entity(name = "fan_user_identity")
public class UserIdentity extends GenericModel {
  @EmbeddedId
  public UserIdentityKey id;
  @Column(name = "provider_id")
  public String providerId;

  public UserIdentity() {
  }

  public UserIdentity(UserIdentityKey id, String providerId) {
    this.id = id;
    this.providerId = providerId;
  }

  public static class UserIdentityKey implements Serializable {
    @Column(name = "user_id")
    public Long userId;
    @Column(name = "type") @Enumerated(STRING)
    public ProviderType type;

    public UserIdentityKey(Long userId, ProviderType type) {
      this.userId = userId;
      this.type = type;
    }
  }
}
