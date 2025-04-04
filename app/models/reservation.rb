class Reservation < ApplicationRecord
  belongs_to :schedule
  belongs_to :sheet
  belongs_to :screen
  validates :date, :schedule_id, :sheet_id, :screen_id, uniqueness: { scope: [:schedule_id, :sheet_id, :date, :screen_id], message: "この組み合わせはすでに予約されています。" }
  validate :valid_email_format

  private

  def valid_email_format
    unless email =~ /^[\w+\-.]+@[a-zA-Z\d\-.]+\.[a-zA-Z]+$/i
      errors.add(:email, "は有効なメールアドレスではありません。")
    end
  end
end
