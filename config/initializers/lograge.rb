Rails.application.configure do
    config.lograge.enabled = true
  
    # If you're using Rails 5's API-only mode and inherit from ActionController::API, you must define it as the controller base class which lograge will patch:
    # config.lograge.base_controller_class = 'ActionController::API'
  
    # JSON(logstash形式)で出力
    config.lograge.formatter = Lograge::Formatters::Logstash.new
  
    # オリジナルのlogを残す
    config.lograge.keep_original_rails_log = true
  
    # logrageのlogを別ファイルに保存
    config.lograge.logger = ActiveSupport::Logger.new "#{Rails.root}/log/lograge_#{Rails.env}.log"
  
    # 独自パラメータを取得 (controllerが落ちてくる)
    config.lograge.custom_payload do |controller|
      params = controller.request.params.except(* %w[controller action])
  
      {
        request_id: controller.request.request_id,
        user_id: controller.try(:current_user).try(:id), # 例) 確定してるなら&.のほうが良い
        params: params
      }
    end
  
    # 独自パラメータを設定 (ActiveSupport::Notifications::Event name='process_action.action_controller' が落ちてくる)
    config.lograge.custom_options = lambda do |event|
      ret = {
        request_ip: event.payload[:request_ip],
        error_message: nil,
        error_stacktrace: nil
      }
  
      if (eo = event.payload[:exception_object])
        ret.merge!(
          error_message: eo.message,
          error_stacktrace: eo.backtrace.join("\n")
        )
      end
  
      ret
    end
end
