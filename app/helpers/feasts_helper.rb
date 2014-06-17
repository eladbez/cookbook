module FeastsHelper

def link_to_remove
  f.hidden_field :_destroy
  link_to_function "remove","remove_fields(this)"
end

end
