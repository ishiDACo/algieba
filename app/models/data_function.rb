# == Schema Information
#
# Table name: data_functions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  software_id  :integer
#  type         :string(255)
#  det          :integer
#  ret          :integer
#  lock_version :integer
#  created_at   :datetime
#  updated_at   :datetime
#  name         :string(255)
#

class DataFunction < ActiveRecord::Base

  # associations.
  belongs_to :software

  # validations.
  validates :user_id,
  presence: true

  validates :software_id,
  presence: true

  validates :type,
  presence: true

  validates :name,
  presence: true,
  length: { maximum: 255, allow_blank: true }

  validates :det,
  numericality: { only_integer: true,
    greater_than_or_equal_to: 0 }

  validates :ret,
  numericality: { only_integer: true,
    greater_than_or_equal_to: 0 }

  def complexity
    complexity = :low
    if det < 20
      complexity = :average if ret > 5
    elsif det < 51
      if ret < 2
        complexity = :low
      elsif 2 <= ret && ret <= 5
        complexity = :average
      elsif ret > 5
        complexity = :high
      end
    else
      complexity = (ret < 2) ? :average : :high
    end
    complexity
  end

end
