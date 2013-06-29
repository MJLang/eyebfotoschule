class Asset < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  has_attached_file :image

  scope :preview, -> { where(:category => 'preview') }
  scope :promotional, -> { where(:category => 'promotional') }
end
