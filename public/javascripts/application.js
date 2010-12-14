// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var $j = jQuery.noConflict();

$j(document).ready(function(){

    /* Used globally for all class=listing tables */
    $j('.listing tr').click(function() {        
        var href = $j(this).find("a").attr("href");
        if(href) {
            window.location = href;
        }
    });

});




