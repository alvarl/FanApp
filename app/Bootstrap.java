import play.jobs.*;
import securesocial.provider.*;

@OnApplicationStart
public class Bootstrap extends Job {

  public void doJob() {
    UserService.setService(new FanUserService());
  }

}
