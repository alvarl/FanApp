package controllers;

import models.User;
import notifiers.Mails;
import play.data.validation.Required;
import play.data.validation.Validation;

import java.util.Date;

public class Application extends SecurityAwareController {

  public static void index() {
    render();
  }

  public static void signupForm() {
    render();
  }

  public static void signup(@Required String email, @Required String password, @Required String confirmPassword, @Required String realName) {
    Validation.equals("secure.password", password, "secure.confirmPassword", confirmPassword);
    Validation.email("secure.email", email);

    if(Validation.hasErrors()) {
      params.flash();
      Validation.keep();
      signupForm();
    } else {
      User newUser = new User(email, password, realName);
      newUser.generateActivationKey();
      newUser.save();
      Mails.activationKey(newUser);
      render();
    }
  }
  
  public static void resendActivationKey(String email) {
    User u = User.find("byActivatedIsNullAndEmail", email).first();
    if(u!= null) {
      Mails.activationKey(u);
    }
    flash.success("secure.activationSent");
    renderTemplate("Application/activate.html");
  }
  
  public static void activate(String email, String activationKey) {
    flash.put("email", email);
    User u = User.find("byEmailAndActivationKey", email, activationKey).first();
    if(u == null) {
      flash.error("badKey");
    } else {
      if(u.isActivated()) {
        flash.error("alreadyActivated");
      } else {
        u.activated = new Date();
        u.save();
        flash.success("userActivated");
      }
    }
    render(u);
  }

}