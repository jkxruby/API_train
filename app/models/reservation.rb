class Reservation < ApplicationRecord

      validates_presence_of :number
      has_many :reservations

      def available_seats
        # TODO: 回传有空的座位，这里先暂时固定回传一个数组，等会再来处理
        ["1A", "1B", "1C", "1D", "1F"]
      end


end
