require 'csv'

@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"

  puts "9. Exit" 
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = STDIN.gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    update_students_array(name)

    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def update_students_array(name)
  add_info_to_students(name, "november")
  puts "Now we have #{@students.count} students"
end

def add_info_to_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  ask_for_filename

  CSV.open(filename, "w") do |csv|

    @students.each do |student|
      csv << [student[:name], student[:cohort]].join(",")
    end
  end
  puts "The students were saved"
end

def ask_for_filename
  puts "Provide filename:"
  filename = STDIN.gets.chomp

  if !File.exists?(filename) 
    puts "Sorry, #{filename} doesn't exist."
    exit 
  end
end

def load_students(filename = "students.csv")
  ask_for_filename

    CSV.foreach(filename) do |line|
    add_info_to_students(line[0], line[1])
  end
  puts "The students were loaded"
end

def try_load_students
  filename = ARGV.first 
  if filename.nil? 
    load_students
  else
    if File.exists?(filename) 
      load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else 
      puts "Sorry, #{filename} doesn't exist."
      exit 
    end
  end
end

try_load_students
interactive_menu