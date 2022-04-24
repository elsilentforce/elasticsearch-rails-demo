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

  def self.custom_search(query)
    result = UsersIndex.query({
      bool: {
        should: [
          {
            match: {
              first_name: {
                query: query,
                operator: :and,
                analyzer: :english
              }
            }
          }
        ]
      }
    }).objects
  end

  def self.complex_search(query)
    result = UsersIndex.query({
      bool: {
        should: [
          {
            match: {
              first_name: {
                query: query,
                operator: :and,
                analyzer: :english
              },
            }
          },
          {
            match: {
              last_name: {
                query: query,
                operator: :and,
                analyzer: :english,
                boost: 3
              }
            }
          }
        ]
      }
    }).objects
  end

end
