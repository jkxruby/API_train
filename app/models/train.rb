class Train < ApplicationRecord

      validates_presence_of :number
      has_many :reservations

        # 产生所有位置从 1A~6C
        # ["1A", "1B", "1C", "2A", "2B", "2C", "3A", "3B", "3C",
        #  "4A", "4B", "4C", "5A", "5B", "5C", "6A", "6B", "6C"]
        SEATS = begin
          (1..6).to_a.map do |series|
            ["A","B","C"].map do |letter|
             "#{series}#{letter}"
            end
          end
        end.flatten


      def available_seats
        # 所有的 SEATS 扣掉已经订位的资料
        return SEATS - self.reservations.pluck(:seat_number)
      end
end
