
$(function() {
  $( "#catalog" ).accordion();
  $( "#catalog li" ).draggable({
                               appendTo: "body",
                               helper: "clone"
                               });
  $( "#cart ul" ).droppable({
                            activeClass: "ui-state-default",
                            hoverClass:  "ui-state-hover",
                            accept: ":not(.ui-sortable-helper, .not_draggable)",
                            out: function (event, ui) {
                            	var self = ui;
                            	ui.helper.off('mouseup').on('mouseup', function () {
                                                            $(this).remove();
                                                            self.draggable.remove();
                                                        });
														$.ajax({
							                                   type:   "POST",
							                                   url:    "/armies/update_army_list/",
							                                   data:   {id: ui.draggable.attr("value"), 
							                                   			points: $("#points_left").text(),
																		move: "remove",
																		army_id: $("#army_title").attr("value")}
							                              });								
                            },
							drop: function( event, ui ) {
                              if (ui.draggable.is('.dropped')) return false;
                              $( this ).find( ".placeholder" ).remove();
                            $( "<li class='unit'></li>").text( ui.draggable.text() ).appendTo( this ).draggable({
                                                                                                                 appendTo: "body",
                                                                                                                 helper: "clone"
                                                                                                                }).addClass('dropped').val(ui.draggable.attr("value"));  
                            $.ajax({
                                   type:   "POST",
                                   url:    "/armies/update_army_list/",
                                   data:   {id: ui.draggable.attr("value"), 
                                   			points: $("#points_left").text(),
											move: "add",
											army_id: $("#army_title").attr("value") }
                              });
                            }
                            }).sortable({
                                        items: "li:not(.placeholder)",
                                        sort: function() {
                                        // gets added unintentionally by droppable interacting with sortable
                                        // using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
                                        $( this ).removeClass( "ui-state-default" );
                                        }
                         				});
  });


$(function() {
  $( "#progressbar" ).progressbar({
								value: 0
                                  });
});


$(function() {
  $( "#slider" ).slider({
                        value:2000,
                        min:  200,
                        max:  10000,
                        step: 100,
                        slide: function( event, ui ) {
                        $( "#amount" ).val( ui.value );
                        }
                        });
  $( "#amount" ).val($( "#slider" ).slider( "value" ) );
});

