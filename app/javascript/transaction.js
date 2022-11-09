$(document).ready(function(){
  $("#expense_category").hide();
  $("#transaction_type").val('income');
  $("#transaction_category").val($("#income_category").val())

  $("#transaction_type_selection").change(function() {
    const transactionType = $("#transaction_type_selection").val();
    $("#transaction_type").val(transactionType);
    if (transactionType == "expense") {
      $("#expense_category").show()
      $("#income_category").hide()
      $("#transaction_category").val($("#expense_category").val())
    }
    else {
      $("#expense_category").hide()
      $("#income_category").show()
      $("#transaction_category").val($("#income_category").val())
    }
  })

  $("#expense_category").change(() => {
    $("#transaction_category").val($("#expense_category").val())
  })

  $("#income_category").change(() => {
    $("#transaction_category").val($("#income_category").val())
  })
});