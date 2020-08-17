class Waiter
  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    
    best_tipped_meal.customer
  end

  def most_frequent_customer
    # go through a waiter's meals 
    # go through every customer 
    # for every meal with a customer's name, increment a counter 
    # return the counter with the highest value 

    # go through a waiter's meals 
    # count how many meals for each customer 
    # return customer with highest count 

    # return meals with this customer name 
    # do for each customer name 
    # return customer name with highest value 

    Customer.all.each_with_index do |customer, i|
      self.meals.select {|meal| meal.customer == customer}
    end
  end

end
