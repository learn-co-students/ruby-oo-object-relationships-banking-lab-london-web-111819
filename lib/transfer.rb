class Transfer
  # your code here

  attr_reader :receiver, :sender
  attr_accessor :amount, :status 


  def initialize (sender, receiver, amount)
    @receiver = receiver
    @sender = sender
    @amount = amount 
    @status = "pending"
  end 

  def valid?
    if sender.valid? && receiver.valid?
      return true 
    else 
      return false
    end 
  end 

  def execute_transaction
    if valid? && sender.balance >= @amount && @status == "pending"
        sender.balance -= @amount
        receiver.balance += @amount 
        @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    if valid? && receiver.balance >= @amount && @status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount 
      @status = "reversed"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end 
  end 
end


