class Reservation < ApplicationRecord
  belongs_to :schedule
  belongs_to :sheet

  validate :valid_email_format

  private

  def valid_email_format
    unless email =~ /^[\w+\-.]+@[a-zA-Z\d\-.]+\.[a-zA-Z]+$/i
      errors.add(:email, "は有効なメールアドレスではありません。")
    end
  end
end
