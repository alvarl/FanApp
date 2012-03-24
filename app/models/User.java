package models;

import org.apache.commons.codec.binary.Base64;
import play.Play;
import play.db.jpa.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

@Entity
public class User extends Model {

  public String email;
  public String password;
  public String fullName;
  public boolean isAdmin;
  public Date activated;
  @Column(name = "activation_key")
  public String activationKey;


  public User(String email, String password, String fullName) {
    this.email = email;
    this.password = password;
    this.fullName = fullName;
  }

  public void generateActivationKey() {
    try {
      activationKey = new String(Base64.encodeBase64(MessageDigest.getInstance("MD5").digest((email + Play.secretKey).getBytes("UTF-8"))), "UTF-8");
    }
    catch (NoSuchAlgorithmException e) {
      //ignore
    }
    catch (UnsupportedEncodingException e) {
      //ignore
    }
  }

  public static User authenticate(String email, String password) {
    return find("byEmailAndPassword", email, password).first();
  }

  public boolean isActivationKeyValid(String key) {
    return key != null && key.equals(activationKey);
  }

  public boolean isActivated() {
    return activated != null;
  }

}