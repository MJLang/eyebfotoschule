class Asset < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true

  has_attached_file :image,
                    :styles => 
                      {
                        :small => '75x75',
                        :small_prop => '75x75>',
                        :small_fixed => "75x75!",
                        :one_by_one => "333x333!",
                        :one_by_two => "333x666!",
                        :two_by_one => "666x333!",
                        :two_by_two => "666x666!"

                      }

  scope :preview, -> { where(:category => 'preview') }
  scope :promotional, -> { where(:category => 'promotional') }
end
