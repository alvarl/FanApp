package models;

public class OutOfTicketsException extends Throwable {
  private Event event;
  private int wanted;
  private int remaining;

  public OutOfTicketsException(Event event, int wanted, int remaining) {
    super("We only have " + remaining + " out of the " + wanted + " tickets for " + event);
    this.event = event;
    this.wanted = wanted;
    this.remaining = remaining;

  }

  @Override
  public String toString() {
    return "OutOfTicketsException[" +
      "event=" + event +
      ", wanted=" + wanted +
      ", remaining=" + remaining +
      "]";
  }
}
