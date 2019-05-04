class ApplicationController < ActionController::Base
   # 以下を書くだけでよい
  prepend_view_path Rails.root.join("frontend")
end
