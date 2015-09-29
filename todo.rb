require_relative 'config/application'

input = ARGV.shift
Task.assign_indexes
case input
  when "list"
    puts Task.show_all_tasks
  when "add"
    task = Task.create!(task_string: ARGV.join(" "))
    puts "'#{task.task_string}' has been added."
  when "delete"
    index = ARGV[0].to_i
    if index > 0 && index <= Task.all.count
      Task.delete_by_index(index)
    else
      puts "That task doesn't exist."
    end
  when "complete"
    Task.assign_indexes
    Task.find_by(index: ARGV[0].to_i).update(:task_completed => true)
  # when "to_txt"
  #   task_list.to_txt
  else
    raise NoMethodError, "The method \`#{input}\' does not exist."
end