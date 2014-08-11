class InterestSwap < ActiveRecord::Base

  # Table connectors
  self.table_name = "interest_swap"
  self.primary_key = "dissemination_id"


  def self.search(search)
    if search
      self.where('taxonomy = ? AND execution_timestamp > ? AND end_date < ?', 'InterestRate:IRSwap:FixedFloat', (Time.now.to_i - 345600), "#{search}".to_i)
    else
      self.where('taxonomy = ? AND execution_timestamp > ?', 'InterestRate:IRSwap:FixedFloat', (Time.now.to_i - 345600))
    end
  end






end
