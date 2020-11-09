class Hospital < ApplicationRecord
  has_many :doctors
  has_many :patients, through: :doctors

  def doc_count
    self.doctors.count.to_i
  end

  def doc_universities
    self.doctors.pluck(:university).uniq
  end

end
