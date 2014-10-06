#first we print the header
def print_header
	puts "The students of my cohort at Makers Academy"
	puts "------------"
end

# second we take a list of students from the user
def print_list(students)
	students.each_with_index do |student, index|
		print "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)\n"
	end
end


#finally, we print the total
def print_footer(names)
	print "Overall, we have #{names.length} great students\n"
end

def input_students
	print "Please enter the names of the students\n"
	print "To finish, just hit return twice\n"
	#create an empty array
	students = []
	#get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		students << {:name => name, :cohort => :october}
		print "Now we have #{students.length} students\n"
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







