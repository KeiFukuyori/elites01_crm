class Customer < ActiveRecord::Base
    def full_name
        # return family_name + given_nameの略
        family_name + given_name
    end
end
