package models;

import play.db.jpa.*;
import play.i18n.*;

import javax.persistence.*;
import java.math.*;
import java.util.*;

@Entity(name = "fan_ticket_purchase")
public class TicketPurchase extends Model {
  @ManyToOne(optional = false)
  @JoinColumn(name = "web_show_id")
  Event event;
  @ManyToOne(optional = false)
  public User user;
  public int count;
  @Column(name = "bought_at")
  public Date boughtAt;

  public TicketPurchase(Event event, User user, int count) {
    this.event = event;
    this.user = user;
    this.count = count;
  }

  public static TicketPurchase register(Event event, User user, int count) throws OutOfTicketsException, OutOfPointsException {
    BigDecimal price = new BigDecimal(event.getTicketPrice());
    String description = Messages.get("piletiost") + " " + event.toDisplayString();
    PointTransaction.register(user, price.intValue(), description);
    EventTickets.decreaseCountForEvent(event, count);
    TicketPurchase ticketPurchase = new TicketPurchase(event, user, count);
    ticketPurchase.save();
    return ticketPurchase;
  }
}
