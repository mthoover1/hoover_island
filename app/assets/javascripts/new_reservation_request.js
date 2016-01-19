$(document).ready(function(){
  var $reservationRequestForm = $('#new_reservation_request');
  var $startDate = $reservationRequestForm.find('#input1');
  var $endDate = $reservationRequestForm.find('#input2');

  function isReservationRequestFormMissingData() {
    return !$startDate.val() || !$endDate.val();
  }

  function dateString(date) {
    var weekdays = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];

    var months = [ 'January', 'February', 'March', 'April', 'May', 'June',
                   'July', 'August', 'September', 'October', 'November', 'December' ];

    return '<span style="font-weight:600">' + weekdays[date.getDay()] + ' ' + months[date.getMonth()] + ' ' + date.getDate() + '</span>';
  }

  function confirmRequest() {
    var date1 = new Date($startDate.val());
    var date2 = new Date($endDate.val());
    var timeDiff = Math.abs(date2.getTime() - date1.getTime());
    var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

    swal({
      title: 'Are you sure?',
      text: '<span style="font-weight:600">' + diffDays + ' nights</span> from ' + dateString(date1) + ' to ' + dateString(date2) + '.',
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#24632B',
      confirmButtonText: 'Yes, Submit Request',
      closeOnConfirm: false,
      html: true
    }, function(isConfirm) {
      if (isConfirm) $reservationRequestForm.submit();
    });
  }

  $('#submit-new-request').click(function(e) {
    e.preventDefault();

    if (isReservationRequestFormMissingData()) {
      swal({title: 'Select Dates', type: 'error'});
    } else {
      confirmRequest();
    }
  });
});
