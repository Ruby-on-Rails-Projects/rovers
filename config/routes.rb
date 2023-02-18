Rails.application.routes.draw do
    post 'rover' => 'rovers#order_direction'
end
