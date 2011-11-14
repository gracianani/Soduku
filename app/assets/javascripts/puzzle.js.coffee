# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

numbers = ['0','1','2','3','4','5','6','7','8','9']
jQuery ->
	$('input').blur -> 
		if ! ( $(this).val() in numbers or $(this).val() is '')		
			$(this).css( 'color', 'red') 
			$('#talks').html('it is not a number') 
		else
				
			
			current_cell = $(this).parentsUntil('tr', 'td')
			current_table = current_cell.parentsUntil('#puzzle', 'table')
			
			$.ajax {
				url: '/puzzle/cell', 
				type: 'POST',
				dataType: 'html',
				data: { table_index:$('#puzzle table').index(current_table), cell_index:current_table.find('td').index(current_cell), value: $(this).val()}
				success: (msg) -> 
					$('#talks').html(msg)
					}