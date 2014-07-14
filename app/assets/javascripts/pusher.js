$(function(){
  $("#greeting_form").submit(function(event){
    var formEl = $(event.target);
    $.ajax({
      url: formEl.prop("action"),
      data: formEl.serialize(),
      type: "POST"
    });
    return false;
  });

})