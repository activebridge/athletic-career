//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require tinymce-jquery
//= require turbolinks
//= require gmaps/google
//= require lazybox
//= require cloudinary
//= require jquery.datetimepicker.min
//= require jquery.infinite-pages
//= require cocoon
//= require bootstrap-notify
//= require bootstrap-sprockets
//= require_tree .

$(document).on('page:load ready', function() {
  initTiniMCE();
});

$(document).on('change', '[data-behavior~=live-update]', function() {
  $(this.form).trigger('submit.rails');
});

function initTiniMCE() {
  tinyMCE.editors=[]
  tinyMCE.init({
    plugins : ['media advlist autolink lists link image',
      'charmap print preview anchor searchreplace visualblocks image',
      'code fullscreen autoresize insertdatetime media table contextmenu paste'],
      toolbar: 'undo redo | styleselect | bold italic | alignleft aligncenter alignright | bullist | numlist | link | media | code | uploadimage',
      relative_urls: false,
      remove_script_host: false,
      selector: 'textarea.tinymce',
      menubar: false
  });
}
