module Hashable

  def self.create_hash(first_arg, second_arg, arg_names)
    #I'd like to refactor the hash creation methods in foodie_info.rb
    hashed_info = {}
    hashed_info[:arg] = name
    hashed_info[:address] = address
    hashed_info
  end
end
