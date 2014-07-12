Goodreads.configure(
  :api_key => 'qV5HzqB50GO5PqwPOXew',
  :api_secret => '2vAY6yR7yaxsgaUpJ3NJuTQKiqIN0KdiYEigzQU04'
)
#Get global configuration:
Goodreads.configuration  #=> {:api_key => 'KEY'}

#In case you need to reset options:
Goodreads.reset_configuration