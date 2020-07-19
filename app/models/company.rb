class Company < ApplicationRecord
  has_rich_text :description

  validate :email_domain

  before_save :set_city_and_state, if: Proc.new { |company| company.zip_code_changed? }

  private

  def set_city_and_state
  	zip_code = ZipCodes.identify(self.zip_code.to_s)
  	if zip_code
      self.city = zip_code[:city]
      self.state = zip_code[:state_code]
    end
  end

  def email_domain
    if email.present? && !(email.ends_with?("@getmainstreet.com"))
      errors.add(:email, "address is not in correct format")
    end
  end

end
