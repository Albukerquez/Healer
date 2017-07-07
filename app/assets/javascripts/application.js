//= require jquery3
//= require popper
//= require tether
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", function() {
  tinymce.remove();
  tinymce.init({
    height: '475',
    selector:'textarea#post_body',
    plugins: "codesample emoticons image media link code",
    toolbar: "undo redo | styleselect | bold italic link | codesample image media code | emoticons"
  });
});


