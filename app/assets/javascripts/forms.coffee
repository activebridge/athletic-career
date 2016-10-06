@submitForm = -> $(@form).trigger 'submit.rails'

$(document).on 'change', '[data-live] select', @submitForm
$(document).on 'blur', '[data-live] input', @submitForm
