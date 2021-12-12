# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
    has_many :tasks


    #No pasa info en blanco
    validates :name, :description, presence: true
    #Validacion de unicidad en cuanto a cierto campo
    validates :name, uniqueness: { case_sensitive: false }

end
