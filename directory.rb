require 'Date'
require 'CSV'

@students = []

#first we print the header
def print_header
	puts "The student#{plural} of my cohort at Makers Academy".center(100)
	puts "------------".center(100)
end

# unsorted list of students
def print_student_list
	@students.each_with_index do |student, index|
		puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort).".center(100)
	end
end

# list of students sorted by month
def print_sorted_list
	sorted_students = @students.sort_by {|student| Date::MONTHNAMES.index("#{student[:cohort]}")}
	sorted_students.each do |student| 
		puts "#{student[:name]} (#{student[:cohort]} cohort).".center(100)
	end
end

def plural
	@students.length == 1 ? "" : "s"
end

#finally, we print the total
def print_footer
	puts "Overall, we have #{@students.length} great student#{plural}.".center(100)
end


def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	until (name = STDIN.gets.chomp).empty?
		add_student(name, add_cohort)
		puts "Now we have #{@students.length} student#{plural}"
	end
	#return the array of students
	@students
end


def add_cohort
	puts "Please select their cohort month (1-12):"
	until (1..12) === (cohort_index = STDIN.gets.chomp.to_i)
		puts "Enter a number from 1 to 12."
	end
	cohort = Date::MONTHNAMES[cohort_index]
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
		input = STDIN.gets.chomp
		print_header
		input = "y" ? print_sorted_list : print_student_list
		print_footer
	else
		puts "There are no students stored."
	end
end

def choose_file
	puts "Please enter the name of the file you want to use, press return to use default:"
	filename = STDIN.gets.chomp + ".csv"
	filename == ".csv" ? filename = "students.csv" : filename
end


def save_students(filename)
	# open the file for writing
	CSV.open(filename, "w") do |file|
	# iterate over the array of students
		@students.each do |student|
			student_data = [student[:name], student[:cohort]]
			file << student_data
		end
	end
	puts "File saved." 
end

def load_students(filename)
	CSV.foreach(filename, "r") do |row|
			add_student(row[0], row[1])
	end
end

def try_load_students
	filename = ARGV.first # first argument from the command line
	return if filename.nil? # get out of the method if it isn't given
	if File.exists?(filename) # if it exists
		load_students(filename)
			puts "Loaded #{@students.length} student#{plural} from #{filename}"
	else # if it doesn't exist
		puts "Sorry, #{filename} doesn't exist."
		exit
	end
end


def add_student(name, cohort)
	@students << {:name => name.capitalize, :cohort => cohort.to_sym}
end

def process(selection)
	case selection
		when "1"
			input_students
		when "2"
			show_students
		when "3"
			save_students(choose_file)
		when "4"
			load_students(choose_file)
		when "9"
			exit
		else
			puts "I dont' know what you meant, try again."
	end
end


def interactive_menu
	try_load_students
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

interactive_menu






