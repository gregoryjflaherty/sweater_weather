class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image, :credit
  set_type 'image'
  set_id { :null }
end
