def create_grocery_list
  print "Enter a name for grocery list: "
  list_name = gets.chomp.to_s

  return {"name" => list_name, "items" => []}
end

def add_new_item
  print "What would you like to add: "
  item_name = gets.chomp.to_s
  print "How much: "
  item_qty = gets.chomp.to_i
  return {"name" => item_name, "quantity" => item_qty}
end

def continue?()
  print "Add more items (yes|no)? "
  answer = gets.chomp.to_s.downcase
  if answer == 'yes'
    return true
  else
    return false
  end
end


def print_character(character, times)
  puts character.to_s * times.to_i
end

def print_list(list)
  print_character("-", 75)
  list["items"].each do |item|
    puts "\tName: \t\t\t#{item['name'].to_s}"
    puts "\tQty: \t\t\t#{item['quantity'].to_s}"
  end
  print_character("-", 75)
end

list = create_grocery_list()
puts "Great! I created #{list['name']} for you. Now add items."
continue_add = true
while continue_add == true do
  new_item = add_new_item()
  list["items"].push(new_item)
  continue_add = continue?()
end

print_list(list)
