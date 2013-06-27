namespace :nginx do
  task :setup do
    template "nginx_puma.erb", "/tmp/nginx_conf"
    template "nginx_base.erb", "/tmp/nginx_base"
    run "#{sudo} rm -f /etc/nginx/nginx.conf"
    run "#{sudo} rm -f /etc/nginx/conf.d/default.conf"
    run "#{sudo} rm -rf /etc/nginx/sites-enabled/#{application}.conf"
    run "#{sudo} mv /tmp/nginx_base /etc/nginx/nginx.conf"
    run "#{sudo} mv /tmp/nginx_conf /etc/nginx/conf.d/#{application}.conf"
    run "#{sudo} service nginx restart"
  end
  # after "deploy:setup", "nginx:setup"

  task :restart do
    run "#{sudo} service nginx restart"
  end
  after "deploy:cleanup", "nginx:restart"
end