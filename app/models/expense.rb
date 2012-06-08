class Expense < ActiveRecord::Base
  attr_accessible :amount, :justification, :purchase_date, :report_id, :title
end
