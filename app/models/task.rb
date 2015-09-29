class Task < ActiveRecord::Base
  belongs_to :list
  validates_uniqueness_of :index, allow_blank: true

  def self.assign_indexes
    i = 1
    self.find_each do |task|
      task.update(index: i)
      i += 1
    end
  end

  def self.show_all_tasks
    self.assign_indexes
    self.find_each do |task|
      print "#{task.index}. "
      task.task_completed ? (print "[x]") : (print "[ ]")
      puts " #{task.task_string}"
    end
  end

  def self.delete_by_index(index)
    self.assign_indexes
    task_to_delete = self.find_by(index: index).task_string.dup
    self.where(index: index).destroy_all
    puts "'#{task_to_delete}' has been deleted."
    self.assign_indexes
  end

end
