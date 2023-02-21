SimpleCov.start 'rails' do
  add_group 'Services', 'app/services'
  add_filter %w[app/jobs app/mailers app/views]
end
