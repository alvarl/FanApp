package controllers;

import models.Category;
import models.Task;
import play.data.binding.As;
import play.data.validation.Required;
import play.data.validation.Validation;
import play.mvc.With;

import java.util.Date;

@With(Secure.class)
public class Tasks extends SecurityAwareController {

  public static void add(@Required Long categoryId, @Required String title) {
    if(Validation.hasErrors()) {
      error(400, "validation failed");
      return;
    }    
    Category category = Category.findById(categoryId);
    Task task = new Task(title, null, category);
    task.save();    
    renderText(task.id);
  }
  
  public static void show(Long taskId) {
    Task task = Task.findById(taskId);
    renderTemplate("task.html", task);
  }
  
  public static void toggleDone(Long taskId) {
    Task task = Task.findById(taskId);
    task.toggleDone();
    task.save();
    renderJSON(task.done);
  }
  
  public static void save(@Required Long taskId, @Required String title, Date date) {
    Task task = Task.findById(taskId);
    task.checkOwner(getCurrentUser());
    task.title = title;
    task.deadline = date;
    task.save();
    renderTemplate("task.html", task);
  }
  
  public static void schedule(@Required Long taskId, @As("dd.MM.yyyy HH:mm") Date start, @As("dd.MM.yyyy HH:mm") Date end) {
    Task task = Task.findById(taskId);
    task.checkOwner(getCurrentUser());
    task.setStartTime(start);
    task.setEndTime(end);
    task.save();
    renderJSON("{}");
  }
  
  public static void details(@Required Long taskId) {
    Task task = Task.findById(taskId);
    task.checkOwner(getCurrentUser());
    renderTemplate("task-details.html", task);
  }
}