module InitText
	class << self # nest a self defined class
	  def continue(str1, str2) # define self method continue; pass in str1 and str2
	    puts str1; # print string1
	    print str2; # print string2
	    gets; # press the enter key to continue
	  end; # end `continue` method
	end; # end self class
	continue(ObjectArrays::STRINGS[0], ObjectArrays::STRINGS[1]); # call continue method while passing in these 2 strings
end;