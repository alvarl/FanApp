package notifiers;

import models.User;
import play.i18n.Messages;
import play.mvc.Mailer;

public class Mails extends Mailer {

  public static void welcome(User user) {
    setSubject(Messages.get("email.welcome.subject", user.name));
    addRecipient(user.email);
    setFrom("Me <me@me.com>");
    send(user);
  }

  public static void activationKey(User user) {
    setSubject(Messages.get("email.activationKey.subject"));
    addRecipient(user.email);
    setFrom("Me <me@me.com>");
    send(user);
  }

}
