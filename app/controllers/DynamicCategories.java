package controllers;

import models.CalendarCollection;
import models.Category;
import models.DynamicCategory;
import models.TaskCollection;
import play.mvc.With;

import java.util.List;

@With(Secure.class)
public class DynamicCategories extends SecurityAwareController {
  public static void show(String name) {
    TaskCollection category = DynamicCategory.get(name);
    render(category);
  }
  
  @SuppressWarnings("unchecked")
  public static void calendar(Long categoryId) {
    CalendarCollection calendarTasks = new CalendarCollection();
    Category footerCategory = null;
    for (Category c : ((List<Category>) renderArgs.get("categories"))) {
      if(categoryId == null || c.id.equals(categoryId)) {
        footerCategory = c;
        break;
      }
    }
    render(calendarTasks, footerCategory);
  }
 
}