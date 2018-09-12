#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Poker hands
# Problem 54
# In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:
# 
#    High Card:       Highest value card.
#    One Pair:        Two cards of the same value.
#    Two Pairs:       Two different pairs.
#    Three of a Kind: Three cards of the same value.
#    Straight:        All cards are consecutive values.
#    Flush:           All cards of the same suit.
#    Full House:      Three of a kind and a pair.
#    Four of a Kind:  Four cards of the same value.
#    Straight Flush:  All cards are consecutive values of same suit.
#    Royal Flush:     Ten, Jack, Queen, King, Ace, in same suit.
#
# The cards are valued in the order:
# 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
# 
# If two players have the same ranked hands then the rank made up of the highest value wins; for example, a pair of
# eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players have a pair of
# queens, then highest cards in each hand are compared (see example 4 below); if the highest cards tie then the next
# highest cards are compared, and so on.
#
# The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains ten
# cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's cards.
# You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand is in no
# specific order, and in each hand there is a clear winner.
# 
# How many hands does Player 1 win?
#
# ---------------------------------------------------------------------------------------------------------------------
require "set"

class Card
	attr_accessor :value, :suit, :code
	Face_values = {
		'2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
		'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14
	}

	# codes are like 5H (5 of Hearts), TC (10 of Clubs), etc
	def initialize(code)
		@value = Face_values[code[0]]
		@suit = code[1]
	end

	def inspect
		return "#{@value}:#{@suit}"
	end

	def <=>(other)
		self.value <=> other.value
	end

	def to_s
		return inspect
	end
end

class Hand
	attr_accessor :hand, :ranking_cards

	@cards
	@ranking_cards
	@hand
	Hand_values = {
		'ROYAL_FLUSH' => 10, 'STRAIGHT_FLUSH' => 9, 'FOUR_OF_KIND' => 8, 'FULL_HOUSE' => 7, 'FLUSH' => 6,
		'STRAIGHT' => 5, 'THREE_OF_KIND' => 4, 'TWO_PAIR' =>3, 'PAIR' => 2, 'HIGH_CARD' => 1
	}

	def equal_values(first_list, second_list = [])
		result = true
		first_list.drop(1).map{|i|
			result = result && (@cards[i].value == @cards[first_list[0]].value)
		}
		second_list.drop(1).map{|i|
			result = result && (@cards[i].value == @cards[second_list[0]].value)
		}
		return result
	end

	def set_ranking_cards(list)
		@ranking_cards = list.map{|i| @cards[i]}
	end

	# e.g. "3D 6D 7H QD QS"
	def initialize(codes)
		@cards = codes.split(" ").map { |s| Card.new(s) }.sort {|a,b| a <=> b}.reverse
		
		distinct_suits = Set.new.merge @cards.map{|card| card.suit}

		is_straight =
			@cards[0].value-1 == @cards[1].value &&
			@cards[0].value-2 == @cards[2].value &&
			@cards[0].value-3 == @cards[3].value &&
			@cards[0].value-4 == @cards[4].value

		if @is_straight && @cards[0].value == 14 && distinct_suits.size == 1
			@hand = 'ROYAL_FLUSH'
			return
		end

		if is_straight && distinct_suits.size == 1
			@hand = 'STRAIGHT_FLUSH'
			set_ranking_cards([0])
			return
		end

		# Four of a kind
		if equal_values([0,1,2,3])
			@hand = 'FOUR_OF_KIND'
			set_ranking_cards([0])
			return
		end
		if equal_values([1,2,3,4])
			@hand = 'FOUR_OF_KIND'
			set_ranking_cards([1])
			return
		end
		
		# Full house
		if equal_values([0,1,2],[3,4])
			@hand = 'FULL_HOUSE'
			@ranking_cards = [@cards[0]]
			return
		end
		if equal_values([0,1],[2,3,4])
			@hand = 'FULL_HOUSE'
			set_ranking_cards([2])
			return
		end

		# Flush
		if distinct_suits.size == 1
			@hand = 'FLUSH'
			set_ranking_cards([0,1,2,3,4])
			return
		end

		# Straight
		if is_straight
			@hand = 'STRAIGHT'
			set_ranking_cards([0])
			return
		end

		# 3 of a kind
		if equal_values([0,1,2])
			@hand = 'THREE_OF_KIND'
			set_ranking_cards([0,3,4])
			return
		end
		if equal_values([1,2,3])
			@hand = 'THREE_OF_KIND'
			set_ranking_cards([1,0,4])
			return
		end
		if equal_values([2,3,4])
			@hand = 'THREE_OF_KIND'
			set_ranking_cards([2,0,1])
			return
		end


		# 2 pair
		if equal_values([0,1],[2,3])
			@hand = 'TWO_PAIR'
			set_ranking_cards([0,2,4])
			return
		end
		if equal_values([0,1],[3,4])
			@hand = 'TWO_PAIR'
			set_ranking_cards([0,3,2])
			return
		end
		if equal_values([1,2],[3,4])
			@hand = 'TWO_PAIR'
			set_ranking_cards([1,3,0])
			return
		end

		# pair
		if equal_values([0,1])
			@hand = 'PAIR'
			set_ranking_cards([0,2,3,4])
			return
		end
		if equal_values([1,2])
			@hand = 'PAIR'
			set_ranking_cards([1,0,3,4])
			return
		end
		if equal_values([2,3])
			@hand = 'PAIR'
			set_ranking_cards([2,0,1,4])
			return
		end
		if equal_values([3,4])
			@hand = 'PAIR'
			set_ranking_cards([3,0,1,2])
			return
		end

		@hand = 'HIGH_CARD'
		set_ranking_cards([0,1,2,3,4])

	end

	def to_s
		return "#{@cards} -> #{@hand}; Ranking:#{@ranking_cards}"
	end

	def <=>(other)
		if (self.hand == other.hand)
			return self.ranking_cards <=> other.ranking_cards
		else
		    return Hand_values[self.hand] <=> Hand_values[other.hand]
		end
	end

end


#hands = Array.new

#hands.push Hand.new("3D 9D 9S 9C KD")
#hands.push Hand.new("3D 9D 9S 8C 8D")
#hands.push Hand.new("2D 3H 4D 5S 6D")
#hands.push Hand.new("TS JD QD KD 3S")
#hands.push Hand.new("TS JD QD KD AD")
#hands.push Hand.new("TD JD QD KD AD")
#hands.push Hand.new("9D TD JD QD KD")
#hands.push Hand.new("9D 9S JD QD KD")
#hands.push Hand.new("9D 9S 9H 9C KD")
#hands.push Hand.new("9D 9S 9H 8C 8D")
#hands.push Hand.new("9D 9S 8H 8C 8D")
#hands.push Hand.new("3D 9D TD 8D KD")
#hands.push Hand.new("3D 3D TS 8D KD")

#puts hands.sort

count = 0
File.readlines('in.txt').each do |line|
	hand1 = Hand.new(line[0..13])
	hand2 = Hand.new(line[15..30])
	hand1_wins = (hand1 <=> hand2) == 1


	if hand1_wins
		count += 1
#		print "==> "
#	else
#		print "    "
	end
#	puts hand1
#	if !hand1_wins
#		print "==> "
#	else
#		print "    "
#	end
#	puts hand2
#
	if (hand1 <=> hand2) == 0
		puts "ooooops!"
		exit
	end
#
#
#	puts
end

puts "Player 1 wins:#{count}"





