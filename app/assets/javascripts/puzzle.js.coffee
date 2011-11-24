# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

numbers = ['0','1','2','3','4','5','6','7','8','9']
RES_GOOD = 0
RES_ERROR = 1
MSG_GOOD = 'Good Move!'
MSG_ERROR = 'I don\'t think it\'ll work!'

jQuery ->
  $(document).ready ->
    $('#puzzle-container').fadeIn(2000)

    numSelector = $('#numSelector')
    talk = $('#talks')
    
    numSelector.mouseout ->
      $(this).hide();
      
    numSelector.mouseover ->
      $(this).show();
          
    $('.unknown').click ->
      cell = $(this)
      size = 41
      cellid = cell.attr('id').split('-')
      top = size * parseInt(cellid[1])
      left = size * parseInt(cellid[2])
      relativeclass = '.row-' + cellid[1] + ', .column-' + cellid[2]
      
      $('.relativeCells').removeClass('relativeCells')
      $(relativeclass).addClass('relativeCells')
        
      $('.currentCell').removeClass('currentCell')
      cell.addClass('currentCell')
    
      numSelector.css('left', left).css('top', top).fadeIn('fast');
      
    $('.num-eraser').click ->
      $('.currentCell').html('')
      numSelector.hide()
      talk.html('').removeClass('talking')
        
    $('.num-cell').click ->
      cell = $(this)
      currentcell = $('.currentCell')
      currentcell.html(cell.html())
      cellvalue = parseInt(cell.html())
      talk.addClass('talking').html('...')
      numSelector.hide()
  
      if ( NaN == cellvalue )
        talk.html("not a number")
        
      cellid = currentcell.attr('id').split('-')
      row = parseInt(cellid[1])
      column = parseInt(cellid[2])
      
      tableindex = Math.floor( row / 3 ) * 3 + Math.floor( column / 3)
      cellindex = row % 3 * 3 + column % 3
      $.ajax {
    		url: '/puzzle/cell', 
    		type: 'POST',
    		dataType: 'html',
    		data: { table_index:tableindex, cell_index:cellindex, value: cellvalue }
    		success: (msg) -> 
    			status = $.parseJSON(msg).status

    			if RES_GOOD == parseInt(status)
    			  talk.html(MSG_GOOD)
    			  $('.currentCell').removeClass('errorCell')
    			else
    			  $('.currentCell').addClass('errorCell')
    			  talk.html(MSG_ERROR)
    	}
    	
  	

      
