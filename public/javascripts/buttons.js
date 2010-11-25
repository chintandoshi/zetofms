// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var $j = jQuery.noConflict();

$j(function() {

        $j(".newbutton").button({
            icons: {
                primary: "ui-icon-circle-plus"
            }   
        });

       $j(".cancelbutton").button({
            icons: {
                primary: "ui-icon-cancel"
            }
        });

       $j(".closebutton").button({
            icons: {
                primary: "ui-icon-circle-close"
            }
        });

        $j(".editbutton").button({
            icons: {
                primary: "ui-icon-pencil"
            }   
        });
        $j(".deletebutton").button({
            icons: {
                primary: "ui-icon-trash"
            }
        });
        $j(".savebutton").button({
            icons: {
                primary: "ui-icon-circle-check"
            }
        });
        $j(".backbutton").button({
            icons: {
                primary: "ui-icon-circle-arrow-w"
            }
        });
        $j(".printbutton").button({
            icons: {
                primary: "ui-icon-print"
            }
        });
        $j(".attachmentsbutton").button({
            icons: {
                primary: "ui-icon-suitcase"
            }
        });
        $j(".approvebutton").button({
            icons: {
                primary: "ui-icon-locked"
            }
        });
        $j(".searchbutton").button({
            icons: {
                primary: "ui-icon-search"
            }
        });
        $j(".viewbutton").button({
            icons: {
                primary: "ui-icon-arrowreturnthick-1-e"
            }
        });
});



