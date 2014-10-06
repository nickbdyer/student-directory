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
		puts "Please select their cohort:"
		puts "Press 1 for September"
		puts "Press 2 for October"
		puts "Press return for Unknown"
		input = gets.chomp
		case input
		when "1"
			cohort = "September"
		when "2"
			cohort = "October"
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
print_header
print_list(students)
print_footer(students)







