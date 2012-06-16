ExpenseReport::Application.routes.draw do
  resources :reports do
    resources :expenses
  end

  root to: 'reports#index'
end
