require_relative 'menu'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'train_passenger'
require_relative 'train_cargo'
require_relative 'wagon'
require_relative 'wagon_passenger'
require_relative 'wagon_cargo'

app = Menu.new
app.start_application