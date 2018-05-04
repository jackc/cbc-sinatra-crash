require 'sinatra'
require 'ruby-cbc'

get '/' do
  m = Cbc::Model.new
  x1, x2, x3 = m.int_var_array(3, 0..Cbc::INF)
  m.maximize(10*x1 + 6*x2 + 4*x3)
  m.enforce(x1 + x2 + x3 <= 100)
  m.to_problem.solve

  "doesn't get here on Mac"
end
