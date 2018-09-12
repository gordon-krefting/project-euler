#!/usr/bin/env ruby

# You are given the following information, but you may prefer to do some research for yourself.
#
# * 1 Jan 1900 was a Monday.
# * Thirty days has September, April, June and November.
# * All the rest have thirty-one,
# * Saving February alone, which has twenty-eight, rain or shine; and on leap years, twenty-nine.
# * A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

puts "Sundays:"

twentieth_century = 1901..2000

$years = 1900..2015
$months = {
	'January'   => 31,
	'February'  => 28,
	'March'     => 31,
	'April'     => 30,
	'May'       => 31,
	'June'      => 30,
	'July'      => 31,
	'August'    => 31,
	'September' => 30,
	'October'   => 31,
	'November'  => 30,
	'December'  => 31
}

def days_in_month(year, month)
	days = $months[month]
	if ('February' == month && ((year % 4 == 0 && year % 100 != 0) || (year %400 == 0)) )
		days += 1
	end
	return days
end

def next_months_start_day_of_week(year, month, day_of_week)
	weekdays_to_add = days_in_month(year, month)

	return (day_of_week + weekdays_to_add) % 7
end

day_of_week = 0 # we'll keep cycling 0..6 for Monday..Sunday
sunday_count = 0
$years.each do |year|
	$months.keys.each do |month|
		print "#{month}, #{year}: #{day_of_week}"
		if (day_of_week == 6)
			if (twentieth_century === year) 
				sunday_count += 1
			end
			puts " Yes!"
		else
			puts ""
		end
		day_of_week = next_months_start_day_of_week(year, month, day_of_week)
	end
end

puts "Sundays: #{sunday_count}"

#puts days_in_month(1900, 'February') #28
#puts days_in_month(1996, 'February') #29
#puts days_in_month(2000, 'February') #29

#puts next_months_start_day_of_week(2015, 'September', 1)
#puts next_months_start_day_of_week(2015, 'October', 3)
#puts next_months_start_day_of_week(2015, 'November', 6)



