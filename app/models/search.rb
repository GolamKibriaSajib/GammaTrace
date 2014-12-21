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
      elsif col == "effective_date"



      end
      
    end

    array = (arr.join(" AND ")).to_s
    puts array
    MetricInterestrateIrswapFixedfloat.where(array)
  end

  def regex_translator(string)
    string = string.gsub(/\s+/, "")
    if string =~ /(\d+)+[B|Y|D|H|M|S]-(\d+)+[B|Y|D|H|M|S]/ix
        firstint, secondint= string.scan(/\d+/)
        firstletter, secondletter= string.scan(/[BYDHMS]/)
        return firstint + firstletter + " - " + secondint + secondletter
    elsif string =~ /(\d+)+[B|Y|D|H|M|S]/x
        firstint, secondletter= string.scan(/(\d+)([BYDHMS])/).first
        return firstint + " " + secondletter
    end


  end

end