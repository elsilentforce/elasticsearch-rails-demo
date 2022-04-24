class UsersIndex < Chewy::Index
  settings analysis: {
    filter: {
      autocomplete: {
        type: :edge_ngram,
        min_gram: 3,
        max_gram: 10
      }
    },
    analyzer: {
      autocomplete: {
        type: :custom,
        tokenizer: :standard,
        filter: [ :lowercase, :autocomplete ]
      },
      email: {
        tokenizer: :uax_url_email,
        filter: [ :lowercase ]
      }
    }
  }

  index_scope User
  default_import_options batch_size: 50, bulk_size: 10.megabytes

  field :first_name, analyzer: :autocomplete
  field :last_name, analyzer: :autocomplete
  field :email, analyzer: :email
end

