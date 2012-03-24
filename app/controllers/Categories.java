package controllers;

import models.Category;
import models.User;
import play.data.validation.Validation;
import play.i18n.Messages;
import play.mvc.With;

import java.util.List;

@With(Secure.class)
public class Categories extends SecurityAwareController {

  public static void index() {
    List<Category> categories = Category.find("byOwner", getCurrentUser()).fetch();
    render(categories);
  }

  public static void form() {
    render();
  }

  public static void add(String name) {
    User user = User.find("byEmail", Secure.Security.connected()).first();
    Category c = new Category(user, name);
    if(c.validateAndSave()) {
      flash.success(Messages.get("category.added", user.fullName, name));
      show(c.id);
    } else {
      Validation.keep();
      params.flash();
      form();
    }
  }

  public static void save(Long id, String name) {
    Category c = Category.findById(id);
    c.checkOwner(getCurrentUser());
    c.name = name;
    if(c.validateAndSave()) {
      flash.success(Messages.get("category.saved"));
    } else {
      Validation.keep();
      params.flash();
    }
    show(c.id);
  }
  
  public static void delete(Long id) {
    Category c = Category.findById(id);
    c.checkOwner(getCurrentUser());
    c.delete();
    flash.success(Messages.get("category.deleted"));
    index();
  }

  public static void show(Long id) {
    Category category = Category.findById(id);
    render(category);
  }
}