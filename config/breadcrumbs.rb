crumb :root do
  link 'Top', root_path
end


crumb :orders do
  link '注文一覧', orders_path
  parent :root
end

crumb :order_new do
  link '新規'
  parent :orders
end

crumb :order_edit do
  link '編集'
  parent :orders
end


crumb :books do
  link 'Book List', books_path
  parent :root
end

crumb :book_new do
  link '新規'
  parent :books
end

crumb :book_edit do
  link '編集'
  parent :books
end



crumb :notices do
  link 'お知らせ一覧', notices_path
  parent :root
end



crumb :settings_users do
  link 'ユーザ一覧', settings_users_path
  parent :root
end

crumb :settings_user_new do
  link '新規'
  parent :settings_users
end

crumb :settings_user_edit do
  link '編集'
  parent :settings_users
end



crumb :settings_notices do
  link 'お知らせ一覧', settings_notices_path
  parent :root
end

crumb :settings_notice_new do
  link '新規'
  parent :settings_notices
end

crumb :settings_notice_edit do
  link '編集'
  parent :settings_notices
end



crumb :settings_items do
  link '商品一覧', settings_items_path
  parent :root
end

crumb :settings_item_new do
  link '新規'
  parent :settings_items
end

crumb :settings_item_edit do
  link '編集'
  parent :settings_items
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
