def filterFile re,filename
  file=File.open filename
  re=Regexp.new re
  file.each_line do |line|
    if re=~line
      puts line
    end
  end
end