Goodreads.configure(
  :api_key => 'KEY',
  :api_secret => 'SECRET'
)
#Get global configuration:
Goodreads.configuration  #=> {:api_key => 'qV5HzqB50GO5PqwPOXew'}

#In case you need to reset options:
Goodreads.reset_configuration