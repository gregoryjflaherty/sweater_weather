class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image, :credit
  set_id { :null }
  set_type 'image'
end
