Hospice.package :postgresql do
  title 'PostgreSQL'
  category 'Databases'

  cookbook 'postgresql'
  recipe 'postgresql::server'

  config do |config|
    {
      postgresql: {
        config: {
          listen_addresses: '*'
        },
        pg_hba: [
          {type: 'local', db: 'postgres', user: 'postgres', addr: nil, method: 'trust'},
          {type: 'host', db: 'all', user: 'all', addr: '0.0.0.0/0', method: 'md5'},
          {type: 'host', db: 'all', user: 'all', addr: '::1/0', method: 'md5'}
        ]
      }
    }
  end

  input :password do
    title 'Superuser password'
    default 'password'

    config do |value|
      {
        postgresql: {
          password: {
            postgres: value
          }
        }
      }
    end
  end
end