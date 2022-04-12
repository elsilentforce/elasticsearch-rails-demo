class User < ApplicationRecord
  update_index('users'){ self }

  def self.search(query)
    @result = UsersIndex.query(
      query_string: { 
        fields: [:first_name, :last_name, :email],
        query: query,
        default_operator: 'and'
      }
    )
  end
end
