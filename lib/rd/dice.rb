module RD
  class Die
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
        @die_sides = ["captured", "dodge", "dodge"
                      "shot", "shot", "shot"]
      end
    end
  end
end
