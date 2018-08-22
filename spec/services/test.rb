answer = %w(HURRA ILEAC GLENN HEDGE STYES)

down_list = {}
answer[0].split('').each_with_index do |letter, i|
	down_list[i] = letter
	4.times do |count| 
		count += 1
		down_list[i].concat(answer[count][i])
	end
end

down_list.each {|k, v| p v}