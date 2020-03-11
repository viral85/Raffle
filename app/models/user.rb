class User < ApplicationRecord
  validates :email, presence: true, uniqueness: { scope: :raffle_types_id }

  def odds_msg(type_count)
    return "Thanks for signing up! Your odds of winning are #{(100/type_count.to_f).round(2)}%."
  end
end