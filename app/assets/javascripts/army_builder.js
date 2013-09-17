
$(function() {
  $( "#catalog" ).accordion();
  $( "#catalog li" ).draggable({
                               appendTo: "body",
                               helper: "clone"
                               });
  $( "#cart ul" ).droppable({
                            activeClass: "ui-state-default",
                            hoverClass: "ui-state-hover",
                            accept: ":not(.ui-sortable-helper)",
                            drop: function( event, ui ) {
                              $( this ).find( ".placeholder" ).remove();
                              $( "<li></li>" ).text( ui.draggable.text() ).appendTo( this );  
                            $.ajax({
                                   type: "POST",
                                   url: "/armies/update_army_list/",
                                   data: "id="+ui.draggable.attr("value")
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
                                  value: 37
                                  });
  });


$(function() {
  $( "#slider" ).slider({
                        value:2000,
                        min: 200,
                        max: 10000,
                        step: 100,
                        slide: function( event, ui ) {
                        $( "#amount" ).val( ui.value );
                        }
                        });
  $( "#amount" ).val($( "#slider" ).slider( "value" ) );
  });


