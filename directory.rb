require 'Date'

@students = []

#first we print the header
def print_header
	puts "The students of my cohort at Makers Academy".center(100)
	puts "------------".center(100)
end

# unsorted list of students
def print_student_list
	@students.each_with_index do |student, index|
		puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort), hobbies include #{student[:hobbies]} and being born on #{student[:birthplace]}.".center(100)
	end
end

# list of students sorted by month
def print_sorted_list
	sorted_students = @students.sort_by {|student| Date::MONTHNAMES.index("#{student[:cohort]}")}
	sorted_students.each do |student| 
		puts "#{student[:name]} (#{student[:cohort]} cohort), hobbies include #{student[:hobbies]} and being born on #{student[:birthplace]}.".center(100)
	end
end

#finally, we print the total
def print_footer
	last_word = @students.length == 1 ? "student" : "students"
	puts "Overall, we have #{@students.length} great #{last_word}.".center(100)
end

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	#get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		puts "Please select their cohort month (1-12):"
		input = gets.chomp.to_i
		cohort_assigned = false
		while cohort_assigned == false
			case input
			when 1..12
				cohort = Date::MONTHNAMES[input]
				cohort_assigned = true
			else
				puts "Enter a number from 1 to 12."
				input = gets.chomp.to_i
			end
		end
		@students << {:name => name.capitalize, :cohort => cohort.to_sym, :hobbies => :coding, :birthplace => :earth}
		last_word = @students.length == 1 ? "student" : "students"
			puts "Now we have #{@students.length} #{last_word}"
		# get another name from the user
		name = gets.chomp
	end
	#return the array of students
	@students
end


def print_menu
	puts "1. Input the students."
	puts "2. Show the student list."
	puts "3. Save the student list to .csv"
	puts "4. Load the list from the .csv"
	puts "9. Exit"
end


def show_students
	if !@students.empty?
		puts "Sort by cohort?(y/n)"
		input = gets.chomp
		print_header
		case input
		when "y"
			print_sorted_list
		when "n"
			print_student_list
		else
			print_student_list
		end
		print_footer
	else
		puts "There are no students stored in the system."
	end
end

def save_students
	# open the file for writing
	file = File.open("students.csv", "w")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
	puts "File saved."
end

def load_students
	file = File.open("students.csv", "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(',')
		@students << {:name => name, :cohort => cohort.to_sym}
	end
	file.close
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
			puts "I dont' know what you meant, try again."
	end
end


def interactive_menu
	loop do
		print_menu
		process(gets.chomp)
	end
end

interactive_menu






