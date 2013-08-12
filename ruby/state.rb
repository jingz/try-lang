require "state_machine"

class LeaveProcess

  state_machine :state, :initial => :fill_form do

    event :submit_form do
      transition :fill_form => :approve
    end 

    event :approve do
      # check form 
      # field
      transition :approve => :hr
    end

    event :agree do
      transition :hr => :end
    end

  end

  def initialize
    super
  end

end
