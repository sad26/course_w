module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'На главную',
      :icon => 'list',
      :controller => :welcome,
      :action => :index
    }
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new_by_admin,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'},
    ]}
    result << {
      :name => 'Таксопарк',
      :icon => 'taxi',
      :children => [
      {:name => 'Водители',
       :controller => :drivers, :action => :index,
       :icon => 'drivers-license',
       :class => 'long'},
      {:name => 'Заказы',
       :controller => :orders, :action => :index,
       :icon => 'sticky-note',
       :class => 'long'}
    ]}
    result
  end

  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles', 'drivers', 'orders'
      ctr.to_s == controller_name.to_s
    else
      false
    end
  end
end
