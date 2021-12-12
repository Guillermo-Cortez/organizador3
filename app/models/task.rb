# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  due_date    :date
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :integer          not null
#  code        :string
#
class Task < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: "User"
  has_many :participating_users, class_name: "Participant"
  has_many :participants, through: :participating_users, source: :user

  validates :participating_users, presence: true


  #No pasa info en blanco
  validates :name, :description, presence: true
  #Validacion de unicidad en cuanto a cierto campo
  validates :name, uniqueness: { case_sensitive: false }
  #Validacion personalizada
  validate :due_date_validity

  #Callbacks
  before_create :create_code


  #Permite guardar atributos de modelos relacionados en esta caso de la relacion con participant
  accepts_nested_attributes_for :participating_users, allow_destroy: true

  def due_date_validity
    return if due_date.blank?
    return if due_date > Date.today
    errors.add :due_date, I18n.t('task.errors.invalid_due_date')
  end

  def create_code
    self.code = "#{owner_id}#{Time.now.to_i.to_s(36)}#{SecureRandom.hex(8)}"
  end
  
end
