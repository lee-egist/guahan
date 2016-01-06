def set_letters(first2)
  if first2[0] == "n"
      if first2 == "ng"
        return 16
      else
        return 14
      end
  else
    case first2[0]
    when "a"
      return 1
    when "å"
      return 2
    when "b"
      return 3
    when "c"
      return 4
    when "d"
      return 5
    when "e"
      return 6
    when "f"
      return 7
    when "g"
      return 8
    when "h"
      return 9
    when "i"
      return 10
    when "k"
      return 11
    when "l"
      return 12
    when "m"
      return 13
    when "ñ"
      return 15
    when "o"
      return 17
    when "p"
      return 18
    when "r"
      return 19
    when "s"
      return 20
    when "t"
      return 21
    when "u"
      return 22
    when "y"
      return 23
    end
  end
end
