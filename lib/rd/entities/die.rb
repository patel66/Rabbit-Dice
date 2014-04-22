module RD
  class Die

    attr_reader :type

    def initialize(type)
      case type
      when "green"
        @type = "green"
        @die_sides = ["captured", "captured", "captured",
                      "dodge", "dodge", "shot"]
      when "yellow"
        @type = "yellow"
        @die_sides = ["captured", "captured", "dodge",
                        "dodge", "shot", "shot"]
      when "red"
        @type = "red"
        @die_sides = ["captured", "dodge", "dodge",
                      "shot", "shot", "shot"]
      end
    end

    def roll
      return @die_sides[rand(6)]
    end
  end
end
