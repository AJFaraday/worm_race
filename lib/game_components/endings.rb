module GameComponents

  module Endings

    attr_accessor :ending_text

    def dead_ending
      @ending_text = File.read(
        File.join(
          File.join(
            File.dirname(__FILE__),
            '..', '..',
            'declarations',
            'you_died.txt'
          )
        )
      )
      @ended = true
    end

    def win_ending
      @worms = []
      @ending_count ||= 3
      @ending_text ||= File.read(
        File.join(
          File.join(
            File.dirname(__FILE__),
            '..', '..',
            'declarations',
            'you_won.txt'
          )
        )
      )
      if @level['next']
        until @ending_count <= 0
          system('clear')
          puts @ending_text
          puts "Next level in: #{@ending_count}"
          @ending_count -= 1
          sleep 1
        end
        @ending_count = nil
        @ending_text = nil
        init_level(@level['next'])
      else
        @ended = true
      end
    end

    def lose_ending(winner)
      @ending_text = File.read(
        File.join(
          File.join(
            File.dirname(__FILE__),
            '..', '..',
            'declarations',
            'you_lost.txt'
          )
        )
      )
      @ending_text << "\n The winner was as #{winner.class}\n\n"
      @ended = true
    end

  end

end