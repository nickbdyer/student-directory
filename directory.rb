require 'Date'

#first we print the header
def print_header
	puts "The students of my cohort at Makers Academy".center(150)
	puts "------------".center(150)
end

# unsorted list of students
def print_list(students)
	i = 0
	while i < students.length do
			puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort), hobbies include #{students[i][:hobbies]} and being born on #{students[i][:birthplace]}.".center(150)
			i+=1
	end
end

# list of students sorted by month
def print_sorted_list(students)
	sorted_students = students.sort_by {|student| Date::MONTHNAMES.index("#{student[:cohort]}")}
	sorted_students.each do |student| 
		puts "#{student[:name]} (#{student[:cohort]} cohort), hobbies include #{student[:hobbies]} and being born on #{student[:birthplace]}.".center(150)
	end
end

#finally, we print the total
def print_footer(names) 
	if names.length == 1
	puts "Overall, we have #{names.length} great student".center(150)
	else
	puts "Overall, we have #{names.length} great students".center(150)
	end
end

def input_students(students)
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
		students << {:name => name.capitalize, :cohort => cohort.to_sym, :hobbies => :coding, :birthplace => :earth}
		if students.length == 1
			puts "Now we have #{students.length} student"
		else
			puts "Now we have #{students.length} students"
		end
		# get another name from the user
		name = gets.chomp
	end
	#return the array of students
	students
end

def interactive_menu
	students = []
	loop do
		#1. Print Menu, and ask user what they want to do. 
		puts "1. Input the students."
		puts "2. Show the student list."
		puts "9. Exit"
		#2. Ask the user for input. 
		selection = gets.chomp
		#3. Do what the user asked. 
		case selection
		when "1"
			students = input_students(students)
		when "2"
			if !students.empty?
				puts "Sort by cohort?(y/n)"
				input = gets.chomp
				case input
				when "y"
					print_header
					print_sorted_list(students)
					print_footer(students)
				when "n"
					print_header
					print_list(students)
					print_footer(students)
				else
					print_header
					print_list(students)
					print_footer(students)
				end
			else
				puts "There are no students stored in the system."
			end
		when "9"
			Exit
		else
			puts "I dont' know what you meant, try again."
		end
	end
end

interactive_menu








