package models;

import play.db.jpa.*;

import javax.persistence.*;

@Entity(name = "fan_event_tickets")
public class EventTickets extends Model {
  @ManyToOne(optional = false)
  @JoinColumn(name = "web_show_id")
  Event event;
  @Column(name = "tickets")
  int count;

  public EventTickets(Event event, int count) {
    this.event = event;
    this.count = count;
  }

  public static int getCountForEvent(Event event) {
    EventTickets eventTickets = getTicketCounter(event);
    return eventTickets.count;
  }

  private static EventTickets getTicketCounter(Event event) {
    EventTickets eventTickets = find("web_show_id = ?", event.id).first();
    if(eventTickets == null) {
      eventTickets = new EventTickets(event, 10);
      eventTickets.save();
    }
    return eventTickets;
  }

  public static void decreaseCountForEvent(Event event, int decreaseBy) throws OutOfTicketsException {
    EventTickets ticketCounter = getTicketCounter(event);
    if(ticketCounter.count < decreaseBy) { // todo fix possible race condition
      throw new OutOfTicketsException(event, decreaseBy, ticketCounter.count);
    }
    ticketCounter.count--;
    ticketCounter.save();
  }
}
