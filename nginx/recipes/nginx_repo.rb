template '/etc/yum.repos.d/nginx.repo' do
  source 'nginx_repo.erb'
  action :create_if_missing
end
