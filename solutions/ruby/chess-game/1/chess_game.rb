module Chess
  FILES = ('A'..'H').freeze
  RANKS = (1..8).freeze

  def self.valid_square?(rank, file)
    f = file.to_s.upcase
    r = Integer(rank) rescue nil
    FILES.include?(f) && RANKS.include?(r)
  end

  def self.nick_name(first_name, last_name)
    fn = first_name.to_s
    ln = last_name.to_s
    head = fn[0, 2] || ""
    tail = ln.length <= 2 ? ln : ln[-2, 2]
    (head + tail).upcase
  end

  def self.move_message(first_name, last_name, square)
    nick = nick_name(first_name, last_name)
    sq = square.to_s.strip
    return "#{nick} attempted to move to #{square}, but that is not a valid square" if sq.length < 2
    f = sq[0]
    r = sq[1]
    return "#{nick} attempted to move to #{square}, but that is not a valid square" unless valid_square?(r, f)
    "#{nick} moved to #{square}"
  end
end
