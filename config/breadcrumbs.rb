crumb :root do
  link 'Top', root_path
end



crumb :users do
  link 'User List', users_path
  parent :root
end

crumb :user_new do
  link 'New'
  parent :users
end

crumb :user_edit do
  link 'Edit'
  parent :users
end



crumb :books do
  link 'Book List', books_path
  parent :root
end

crumb :book_new do
  link 'New'
  parent :books
end

crumb :book_edit do
  link 'Edit'
  parent :books
end


#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
