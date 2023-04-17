$(document).ready(function () {
  console.log("ready!")
  $.ajax({
    url: "prodInputList",
    type: "GET",
    success: function(data) {
      console.log(data);
    },
    error: function(error) {
      console.log(error);
    }
  });

});

