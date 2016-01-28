
node['environment-variable']['env'].each do |key, value|
  ruby_block key do
    var_line = %{export #{key}="#{value}"}

    block do
      file = Chef::Util::FileEdit.new('/etc/environment')
      file.search_file_replace_line(key, var_line)
      file.insert_line_if_no_match(key, var_line)
      file.write_file
    end

    not_if "grep '#{var_line}' /etc/environment"
  end
end

ruby_block "source" do
  var_line = %{source /etc/environment}

  block do
    file = Chef::Util::FileEdit.new("/home/#{node['ruby-env']['user']}/.bashrc")
    file.search_file_replace_line("source", var_line)
    file.insert_line_if_no_match("source", var_line)
    file.write_file
  end

  not_if "grep '#{var_line}' /home/#{node['ruby-env']['user']}/.bashrc"
end
