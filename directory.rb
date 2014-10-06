#first we print the header
def print_header
	puts "The students of my cohort at Makers Academy"
	puts "------------"
end

# second we take a list of students from the user
def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end


#finally, we print the total
def print_footer(names)
	puts "Overall, we have #{names.length} great students"
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
		students << {:name => name, :cohort => :october}
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
print(students)
print_footer(students)







