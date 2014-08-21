class InterestSwap < ActiveRecord::Base

  # Table connectors
  self.table_name = "interest_swap"
  self.primary_key = "dissemination_id"
  scope :irfixedfloat, lambda {{:conditions =>
    ['taxonomy = ? AND execution_timestamp > ? AND action = ? AND settlement_currency = ?  AND price_notation < ?AND indication_of_other_price_affecting_term = ?', 'InterestRate:IRSwap:FixedFloat', (Time.now.to_i - 1345600), 'NEW', 'USD', 100, 'N']}}
  # named_scope :t_or_t, lambda {{ :conditions => ['price_forming_continuation_data = ? OR price_forming_continuation_data = ?', 'Trade', 'Termination']}}
  def self.search(search)
    if search
      self.where('taxonomy = ? AND execution_timestamp > ? AND end_date < ? AND price_notation < ?', 'InterestRate:IRSwap:FixedFloat', (Time.now.to_i - 1345600), "#{search}".to_i, 100)
    else
      self.where('taxonomy = ? AND execution_timestamp > ? AND price_notation < ?', 'InterestRate:IRSwap:FixedFloat', (Time.now.to_i - 1345600), 100)
    end
  end






end
