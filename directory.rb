#first we print the header
def print_header
	puts "The students of my cohort at Makers Academy".center(150)
	puts "------------".center(150)
end

# second we take a list of students from the user
def print_list(students)
	i = 0
	while i < students.length do
			puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort), hobbies include #{students[i][:hobbies]} and being born on #{students[i][:birthplace]}.".center(150)
			i+=1
	end
end

# second we take a list of students from the user
def print_sorted_list(students)
	sorted_students = students.sort_by {|student| student[:cohort]}
	sorted_students.each do |student| 
		puts "#{student[:name]} (#{student[:cohort]} cohort), hobbies include #{student[:hobbies]} and being born on #{student[:birthplace]}.".center(150)
	end
end

#finally, we print the total
def print_footer(names) 
	puts "Overall, we have #{names.length} great students".center(150)
end

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	#create an empty array
	students = []
	#get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		puts "Please select their cohort month (1-12):"
		input = gets.chomp
		case input
		when "1"
			cohort = "January"
		when "2"
			cohort = "February"
		when "3"
			cohort = "March"
		when "4"
			cohort = "April"
		when "5"
			cohort = "May"
		when "6"
			cohort = "June"
		when "7"
			cohort = "July"
		when "8"
			cohort = "August"
		when "9"
			cohort = "September"
		when "10"
			cohort = "October"
		when "11"
			cohort = "November"
		when "12"
			cohort = "December"
		else
			cohort = "Unknown"
		end
		students << {:name => name.capitalize, :cohort => cohort.to_sym, :hobbies => :coding, :birthplace => :earth}
		puts "Now we have #{students.length} students"
		# get another name from the user
		name = gets.chomp
	end
	#return the array of students
	students
end

#call methods!
students = input_students
if students.empty? == false
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








