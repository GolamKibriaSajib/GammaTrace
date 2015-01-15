class Search < ActiveRecord::Base

  belongs_to :user
  

  def scopingsearch
    hashed_value = self.serializable_hash
    arr = []
    hashed_value.each do |col, val|
      if val != "" && val != nil && col != "id" && col != "effective_date" && col != "created_at" && col != "updated_at" && col != "user_id" && col != "name" && col != "floating_leg_reset"
        wc =  col + " = '" + val.to_s + "'"
        puts wc
        arr.push(wc)
      elsif col == ("effective_date" || col == "end_date") && val != nil 
        wcmult =  regex_translator(col, val)
        wc1 = wcmult.first
        Rails.logger.info ">>>>>>>>>>>>>> WC1: #{wc1} <<<<<<<<<<<<<<<<<<<<<"
        arr.push(wc1)
        if wcmult.length > 1
          wc2 = wcmult.second
          Rails.logger.info ">>>>>>>>>>>>>> WC2: #{wcmult.second} <<<<<<<<<<<<<<<<<<<<<"
          arr.push(wc2)
        end
      end
      
    end

    array = (arr.join(" AND ")).to_s
    Rails.logger.info ">>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<"
    Rails.logger.info ">>>>>>>>>>>>>>>>>#{array}<<<<<<<<<<<<<<<<<<<<<<<"
    Rails.logger.info ">>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<"
    MetricInterestrateIrswapFixedfloat.where(array)
  end

  def regex_translator(col, string)
    string = string.gsub(/\s+/, "")
    if string =~ /(\d+)+[B|Y|D|H|M|S]-(\d+)+[B|Y|D|H|M|S]/ix
        firstint, secondint= string.scan(/\d+/)
        Rails.logger.info ">>>>>>>>>>>>>> Firstint: #{firstint} <<<<<<<<<<<<<<<<<<<<<"
        Rails.logger.info ">>>>>>>>>>>>>> Secondint: #{secondint} <<<<<<<<<<<<<<<<<<<"
        firstletter, secondletter= string.scan(/[BYDHMS]/)
        Rails.logger.info ">>>>>>>>>>>>>> Firstletter: #{firstletter} <<<<<<<<<<<<<<<<<<<<<"
        Rails.logger.info ">>>>>>>>>>>>>> Secondletter: #{secondletter} <<<<<<<<<<<<<<<<<<<"
        firstint = firstint.to_i
        secondint = secondint.to_i
        firstconversion = translator(firstint, firstletter)
        secondconversion = translator(secondint, secondletter)

        result1 = col + " >= '" + firstconversion + "'"
        result2 = col + " <= '" + secondconversion + "'"
        arr = [result1, result2]
        return arr
    elsif string =~ /(\d+)+[B|Y|D|H|M|S]/x
        firstint = string.scan(/\d+/)
        firstint = firstint.first
        firstint = firstint.to_i
        firstletter = string.scan(/[BYDHMS]/)
        firstletter = firstletter.first
        Rails.logger.info ">>>>>>>>>>>>>> Firstint: #{firstint} <<<<<<<<<<<<<<<<<<<<<"
        Rails.logger.info ">>>>>>>>>>>>>> Firstletter: #{firstletter} <<<<<<<<<<<<<<<<<<<<<"
        firstconversion = translator(firstint, firstletter)
        result1 = [col + " >= '" + firstconversion + "'"]
        Rails.logger.info ">>>>>>>>>>>>>> Result1: #{result1} <<<<<<<<<<<<<<<<<<<<<"
        return result1
    end
  end


  def translator(integer, string)
    if string.upcase == "B"
      result = (integer.business_days.from_now.beginning_of_day).to_i
    elsif string.upcase == "D"
      result = (Time.now + integer.day).to_i
    elsif string.upcase == "Y"
      result = (Time.now + integer.year).to_i
    elsif string.upcase == "H"
      result = (Time.now + integer.hour).to_i
    elsif string.upcase == "M"
      result = (Time.now + integer.minute).to_i
    end
    result = result.to_s
    return result
  end




end