# ClientSideValidations Initializer

# Uncomment to disable uniqueness validator, possible security issue
# ClientSideValidations::Config.disabled_validators = [:uniqueness]

# Uncomment the following block if you want each input field to have the validation messages attached.
 ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
   unless html_tag =~ /^<label/
     %{<div class="error_form" style="position:relative">#{html_tag}<label style="position:absolute" for="#{instance.send(:tag_id)}" class="message">#{instance.error_message.first}</label></div>}.html_safe
   else
     %{<div class="error_form">#{html_tag}</div>}.html_safe
   end
 end
