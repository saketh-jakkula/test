#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

package 'httpd'

file '/etc/httpd/conf.d/host.conf' do
  content '<VirtualHost *:80>
  ServerName test.example.com
  DocumentRoot /var/www/html/
  Redirect permanent /test http://test.example.com/index.html
</VirtualHost>'
end

file '/var/www/html/index.html' do
  content '<html>
  <body>
    <h1>saying hi from workstation</h1>
  </body>
</html>'
end


service 'httpd' do
  action [ :enable, :start ]
end



