require './method.rb'
crews = get_employee_id(ARGV[0])
crews.each do |employee|
  puts "#{employee['last_name']} #{employee['first_name']}のアカウントを削除しますか？ "
  input = $stdin.gets.chomp
  if input == 'はい'
    delete_crew(employee['id'])
  else
    puts '取りやめました'
  end
end
