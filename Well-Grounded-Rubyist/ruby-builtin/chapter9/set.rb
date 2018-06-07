require 'set'
puts "======================================================="
puts "+++++++++++++++Creating a Set+++++++++++++="
puts "======================================================="
new_england = ["Connecticut", "Maine", "Massachusetts", "New Hampshire", "Rhode Island", "Vermont"]
state_set = Set.new(new_england)
p state_set


names = ["David", "Yukihiro", "Chad", "Amy"]
name_set = Set.new(names) {|name| name.upcase}
p name_set

puts "======================================================="
puts "+++++++++++++++Manipulating Set element+++++++++++++="
puts "======================================================="
## Adding object to set
tri_state = Set.new(["New Jersy", "New York"])
p tri_state
tri_state << "Connecticut"
p tri_state

## Removing from the set
tri_state << "Pennsylvania"
tri_state.delete("Connecticut")
p tri_state

tri_state.add?("Connecticut") ## add return the new set add? returns nil

puts "======================================================="
puts "+++++++++++++++Set operations+++++++++++++="
puts "======================================================="
tri_state = Set.new(["Connecticut", "New Jersey", "New York"])
p state_set - tri_state
p state_set + tri_state

## Merging a Set
tri_state = Set.new(["Connecticut", "New Jersey"])
tri_state.merge(["New York"])

puts "======================================================="
puts "+++++++++++++++Super Set and Subset+++++++++++++="
puts "======================================================="
small_states = Set.new(["Connecticut", "New Jersey", "Rhode Island"])
p small_states.subset?(state_set)
p state_set.superset?(small_states)
