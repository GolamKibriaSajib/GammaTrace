class Search < ActiveRecord::Base

  belongs_to :user
  

  def scopingsearch
    if self.taxonomy == "InterestRate:IRSwap:FixedFloat"
      InterestSwap.where('taxonomy = ? AND indication_of_collateralization = ? AND indication_of_end_user_exception = ? AND execution_venue = ? AND effective_date = ? AND end_date = ? AND settlement_currency = ? AND notional_currency_1 = ? AND rounded_notional_amount_1 = ?',self.taxonomy,self.indication_of_collateralization,self.indication_of_end_user_exception,self.execution_venue,self.effective_date,self.end_date,self.settlement_currency,self.notional_currency_1,self.rounded_notional_amount_1)
    elsif self.taxonomy == "OIS Swap: InterestRate:IRSwap:OIS"
      InterestSwap.where('taxonomy = ? AND indication_of_collateralization = ? AND indication_of_end_user_exception = ? AND execution_venue = ? AND effective_date = ? AND end_date = ? AND settlement_currency = ? AND notional_currency_1 = ? AND rounded_notional_amount_1 = ?',self.taxonomy,self.indication_of_collateralization,self.indication_of_end_user_exception,self.execution_venue,self.effective_date,self.end_date,self.settlement_currency,self.notional_currency_1,self.rounded_notional_amount_1)
    elsif self.taxonomy == "CCY Swap: InterestRate:CrossCurrency:Basis ||  InterestRate:CrossCurrency:FixedFloat || InterestRate:CrossCurrency:FixedFixed"
      InterestSwap.where('taxonomy = ? AND indication_of_collateralization = ? AND indication_of_end_user_exception = ? AND execution_venue = ? AND effective_date = ? AND end_date = ? AND settlement_currency = ? AND notional_currency_1 = ? AND rounded_notional_amount_1 = ?',self.taxonomy,self.indication_of_collateralization,self.indication_of_end_user_exception,self.execution_venue,self.effective_date,self.end_date,self.settlement_currency,self.notional_currency_1,self.rounded_notional_amount_1)
    elsif self.taxonomy == "Swaption: InterestRate:Option:Swaption"
      InterestSwap.where('taxonomy = ? AND indication_of_collateralization = ? AND indication_of_end_user_exception = ? AND execution_venue = ? AND effective_date = ? AND end_date = ? AND settlement_currency = ? AND notional_currency_1 = ? AND rounded_notional_amount_1 = ?',self.taxonomy,self.indication_of_collateralization,self.indication_of_end_user_exception,self.execution_venue,self.effective_date,self.end_date,self.settlement_currency,self.notional_currency_1,self.rounded_notional_amount_1)
    elsif self.taxonomy == "Cap/Floor: InterestRate:CapFloor"
      InterestSwap.where('taxonomy = ?', "InterestRate:IRSwap:FixedFloat")
    else
      series = []
      return series
    end
  end

end


