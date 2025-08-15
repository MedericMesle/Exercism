module Blackjack
  CARD_VALUES = {
    "ace"   => 11,
    "two"   => 2,
    "three" => 3,
    "four"  => 4,
    "five"  => 5,
    "six"   => 6,
    "seven" => 7,
    "eight" => 8,
    "nine"  => 9,
    "ten"   => 10,
    "jack"  => 10,
    "queen" => 10,
    "king"  => 10
  }.freeze

  def self.parse_card(card)
    CARD_VALUES.fetch(card.to_s.downcase, 0)
  end

def self.card_range(card1, card2)
  total = parse_card(card1) + parse_card(card2)

  case total
  when 4..11  then "low"
  when 12..16 then "mid"
  when 17..20 then "high"
  when 21     then "blackjack"
  else "invalid"
  end
end


def self.first_turn(card1, card2, dealer_card)
  return "P" if card1.casecmp("ace").zero? && card2.casecmp("ace").zero?

  total = parse_card(card1) + parse_card(card2)
  dealer_value = parse_card(dealer_card)

  if total == 21
    return "W" unless [10, 11].include?(dealer_value)
    return "S"
  end

  return "S" if (17..20).include?(total)
  return "S" if (12..16).include?(total) && dealer_value < 7
  return "H" if (12..16).include?(total) && dealer_value >= 7
  return "H" if total <= 11
  "invalid"
end
end
