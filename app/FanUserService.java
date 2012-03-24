import models.*;
import securesocial.provider.*;

public class FanUserService extends DefaultUserService implements UserService.Service {
  @Override
  public SocialUser find(UserId id) {
    UserIdentity userIdentity = UserIdentity.find("byTypeAndProviderId", id.provider.name(), id.id).first();

    // User exists in the database
    if(userIdentity != null) {
      User user = User.findById(userIdentity.id.userId);
      FanUser socialUser = new FanUser(user.id);
      socialUser.displayName = user.name;
      socialUser.email = user.email;
      socialUser.id = id;
      return socialUser;
    }

    return super.find(id);
  }

  @Override
  public void save(SocialUser socialUser) {
    
    UserIdentity userIdentity = UserIdentity.find("byTypeAndProviderId", socialUser.id.provider.name(), socialUser.id.id).first();

    if (userIdentity == null) {
      User user = new User();
      user.email = socialUser.email;
      user.name = socialUser.displayName;
      user.save();

      userIdentity = new UserIdentity(new UserIdentity.UserIdentityKey(user.id, socialUser.id.provider), socialUser.id.id);
      userIdentity.save();
    }
    super.save(socialUser);
  }

}
