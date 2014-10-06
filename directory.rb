# array of students
students = [
 {:name => "John Kiely", :cohort => :october},
 {:name => "Chris Batts", :cohort => :october},
 {:name => "Ben Hutchinson", :cohort => :october},
 {:name => "Ayo Obembe", :cohort => :october},
 {:name => "Mishal", :cohort => :october},
 {:name => "Chris Handley", :cohort => :october},
 {:name => "Giorgia Amici", :cohort => :october},
 {:name => "Attila", :cohort => :october},
 {:name => "Pavel Redics", :cohort => :october},
 {:name => "Janacuq", :cohort => :october},
 {:name => "Edward Byne", :cohort => :october},
 {:name => "Arfah", :cohort => :october},
 {:name => "langesi", :cohort => :october},
 {:name => "Richard Lake", :cohort => :october},
 {:name => "CZC8190BMC", :cohort => :october},
 {:name => "Nick Dyer", :cohort => :october},
 {:name => "Izzy Markwick", :cohort => :october},
 {:name => "Alan Bridger", :cohort => :october},
 {:name => "Alex Blease", :cohort => :october},
 {:name => "Shan Hasan", :cohort => :october},
 {:name => "Claudia Callisto", :cohort => :october},
 {:name => "Dale Stevens", :cohort => :october},
 {:name => "Abdul Hassan", :cohort => :october},
 {:name => "Alan Bridger", :cohort => :october},
 {:name => "Alexander Levin", :cohort => :october},
 {:name => "Ana Nogal", :cohort => :october},
 {:name => "Andrew Harrison", :cohort => :october},
 {:name => "Andrew Hercules", :cohort => :october},
 {:name => "Andrew Snead", :cohort => :october},
 {:name => "Anna Jerofejeva", :cohort => :october},
 {:name => "Bernard Mordan", :cohort => :october},
 {:name => "Camilla van Klinken", :cohort => :october},
 {:name => "Clare Trembath", :cohort => :october},
 {:name => "Colin Smif", :cohort => :october},
 {:name => "Contra Mundi", :cohort => :october},
 {:name => "Craig Horsborough", :cohort => :october},
 {:name => "Daniel Cutler", :cohort => :october},
 {:name => "Daniel Le Dosquet", :cohort => :october},
 {:name => "Elena Garrone", :cohort => :october},
 {:name => "Ella Schofield", :cohort => :october},
 {:name => "Fad Fad", :cohort => :october},
 {:name => "Jana Sanchez", :cohort => :october},
 {:name => "James Carter", :cohort => :october},
 {:name => "Johnny Lakin", :cohort => :october},
 {:name => "Karin Nielsen", :cohort => :october},
 {:name => "Marcherita Serino", :cohort => :october},
 {:name => "Ming Chan",  :cohort => :october},
 {:name => "Nicole Pellicena", :cohort => :october},
 {:name => "Nikesh Ashar", :cohort => :october},
 {:name => "Sandrine Zhang-Ferron", :cohort => :october},
 {:name => "Shan Hasan", :cohort => :october},
 {:name => "Simon Lange", :cohort => :october},
 {:name => "Stephen Giles", :cohort => :october},
 {:name => "Tim Scully", :cohort => :october},
 {:name => "Victoria Stepanovna", :cohort => :october},
 {:name => "Yvette Cook", :cohort => :october},
 {:name => "Zeeshan Rasool", :cohort => :october},
]

#first we print the header
def print_header
	puts "The students of my cohort at Makers Academy"
	puts "------------"
end

# second we print the list of students
def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

#finally, we print the total
def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

#call methods!
print_header
print(students)
print_footer(students)







