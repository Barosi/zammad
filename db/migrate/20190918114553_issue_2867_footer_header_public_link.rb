class Issue2867FooterHeaderPublicLink < ActiveRecord::Migration[5.2]
  def up
    # return if it's a new setup
    return if !Setting.find_by(name: 'system_init_done')

    add_column            :knowledge_base_menu_items, :location, :string, null: false, default: 'header'
    add_index             :knowledge_base_menu_items, :location
    change_column_default :knowledge_base_menu_items, :location, nil
  end

  def down
    remove_column :knowledge_base_menu_items, :location
  end
end
