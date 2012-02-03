class Beer < ActiveRecord::Base
  belongs_to :brewery
  validates :name, :presence => true

  # ERROR: NoMethodError
  # if you comment this out, you will get a NoMethodError exception
  delegate :name, :to => :brewery, :prefix => true

  # ERROR: ArgumentError (Unknown validator: 'UniqueValidator'): if you uncomment this.
  # validates :name, :presence => true, :unique => true

  # ERROR: SystemStackError
  # uncomment this to get this kind of exception... it will happen when you create a new beer from http://localhost:3000
  # after_save  :cause_infinite_loop

  # ERROR: NoMethodError
  # uncomment this to get this kind of exception.. it will happen when you create a new beer from http://localhost:3000
  # before_validation :cause_attribute_error

  def cause_infinite_loop
    self.save
  end

  def cause_attribute_error
    self.hithere= "foo"
  end


end
