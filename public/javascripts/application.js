// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults



var $j = jQuery.noConflict();

$j(function() {
        $j( "#tabs" ).tabs({
                ajaxOptions: {
                        error: function( xhr, status, index, anchor ) {
                                $j( anchor.hash ).html(
                                        "Couldn't load this tab. We'll try to fix this as soon as possible. " +
                                        "If this wouldn't be a demo." );
                        }
                }
        });
});

