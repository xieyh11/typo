Given /the following contents exist/ do |contents_table|
  contents_table.hashes.each do |content|
   Article.create!(content)
  end
end
