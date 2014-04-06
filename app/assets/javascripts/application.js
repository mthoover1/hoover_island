// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .

$(document).ready(function(){

  $('#datepicker').datepicker({
    defaultDate: new Date((new Date().getFullYear()), 6 - 1, 1),
    minDate: 0,
    maxDate: new Date((new Date().getFullYear()), 12 - 1, 31),
    beforeShowDay: function(date) {
      var date1 = $.datepicker.parseDate($.datepicker._defaults.dateFormat, $('#input1').val());
      var date2 = $.datepicker.parseDate($.datepicker._defaults.dateFormat, $('#input2').val());
      return [true, date1 && ((date.getTime() == date1.getTime()) || (date2 && date >= date1 && date <= date2)) ? 'dp-highlight' : ''];
    },
    onSelect: function(dateText, inst) {
      var date1 = $.datepicker.parseDate($.datepicker._defaults.dateFormat, $('#input1').val());
      var date2 = $.datepicker.parseDate($.datepicker._defaults.dateFormat, $('#input2').val());
      if (!date1 || date2) {
        $('#input1').val(dateText);
        $('#input2').val('');
        $(this).datepicker('option', 'minDate', dateText);
      } else {
        $('#input2').val(dateText);
        $(this).datepicker('option', 'minDate', null);
        $( "#datepicker" ).datepicker( "option", "minDate", 0 );
      }
    }
  });

  $('.request-date').hover(
    function(){
      originalText = $(this).attr('placeholder');
      $(this).attr('placeholder','Select on Calendar');
    }, function(){
      $(this).attr('placeholder',originalText);
    }
  );

});
