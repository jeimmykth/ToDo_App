json.extract! task, :id, :description, :is_completed, :to_do_list_id, :created_at, :updated_at
json.url task_url(task, format: :json)
