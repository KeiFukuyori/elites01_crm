class Company < ActiveRecord::Base
    # Companyには複数のCustomersが紐づくので、
    # has_manyを設定。has_manyの場合はモデル名を複数にする
    has_many :customers
    
end
