class Movement < ApplicationRecord
  belongs_to       :book
  after_initialize :default_values


  def default_values
    self.taker_name   ||= username_magic
  end

  def username_magic
    user_name = "User." + "#{('a'..'z').to_a.shuffle[0,4].join}"
    user_name
  end
end
