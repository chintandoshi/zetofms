/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/* orders/_form.html.erb */
$j(document).ready(function(){

    /* */
   $j('#refresh_billing').click(function(){
            var selectedvalue = $j('#order_custaccount_id>option:selected').val();
            selectedvalue ? $j('#order_billingcontact_id').load('/contacts/update_contacts_autocomplete?id='+ selectedvalue) :
                        ( $j('#order_billingcontact_id').html('<option value="">Please Select  </option>'));
            return false;
   });

    /* */
   $j('#refresh_purchase').click(function(){
            var selectedvalue = $j('#order_custaccount_id>option:selected').val();
            selectedvalue ? $j('#order_purchasecontact_id').load('/contacts/update_contacts_autocomplete?id='+ selectedvalue) :
                        ( $j('#order_purchasecontact_id').html('<option value="">Please Select  </option>'));
            return false;
   });


    /* */
    $j('#order_custaccount_id').change(function(){

            this.value? $j('#order_billingcontact_id').load('/contacts/update_contacts_autocomplete?id='+this.value) :
                        ( $j('#order_billingcontact_id').html('<option value="">Please Select  </option>'));

            this.value? $j('#order_purchasecontact_id').load('/contacts/update_contacts_autocomplete?id='+this.value) :
                        ( $j('#order_purchasecontact_id').html('<option value="">Please Select  </option>'));
    });

    /* */
    $j('#order_consignee_id').change(function(){

        this.value?
                    $j.get('/consignees/' + this.value  + '/city_autocomplete',
                    function(data) {$j('#order_to').val(data); })
                    : $j('#order_to').val(""); 
    });

    /* */
    $j('#order_consignor_id').change(function(){

        this.value?
                    $j.get('/consignors/' + this.value  + '/city_autocomplete',
                    function(data) {$j('#order_from').val(data);})
                    : $j('#order_from').val("");
    });


});

/* orders/show.html.erb */
$j(document).ready(function(){

    $j( "#tabs" ).tabs({
    });   
});

function disable_tabs(disabled_tabs) {
    $j( "#tabs" ).tabs({ disabled: disabled_tabs });
}

function select_tab(index) {
    $j("#tabs").tabs("select", index );
}


/* detentions/_form.html.erb */
$j(document).ready(function(){
    runToggle();
});

function runToggle(){
     
      if($j('#detention_billing').attr("checked")) {

         $j('#billingElements :input').removeAttr('readonly');
            return;
      }
       $j('#billingElements :input').val("");
       $j('#detention_paid').prev().val("0");
       $j('#billingElements :input').attr('readonly', true);
}

/* _orderfilter.html.erb _statusfilter.html.erb */
function checkAll()
{
        var checked_status = true;
        $j("input[name='search[current_status_id_equals_any][]']").each(function()
        {
                this.checked = checked_status;
        });
}

function uncheckAll()
{
        var checked_status = false;
        $j("input[name='search[current_status_id_equals_any][]']").each(function()
        {
                this.checked = checked_status;
        });
}

function unbilledAll()
{
        $j("#checkbox_pending").attr('checked','checked');
        $j("#checkbox_acknowledged").attr('checked','checked');
        $j("#checkbox_planning").attr('checked','checked');
        $j("#checkbox_loaded").attr('checked','checked');
        $j("#checkbox_delivered").attr('checked','checked');
        $j("#checkbox_detention").attr('checked','checked');

        $j("#checkbox_billed").removeAttr('checked');
        $j("#checkbox_closed").removeAttr('checked');
        $j("#checkbox_cancelled").removeAttr('checked');
}

function billedAll()
{
        $j("#checkbox_pending").removeAttr('checked');
        $j("#checkbox_acknowledged").removeAttr('checked');
        $j("#checkbox_planning").removeAttr('checked');
        $j("#checkbox_loaded").removeAttr('checked');
        $j("#checkbox_delivered").removeAttr('checked');
        $j("#checkbox_detention").removeAttr('checked');

        $j("#checkbox_billed").attr("checked","checked");
        $j("#checkbox_closed").removeAttr('checked');
        $j("#checkbox_cancelled").removeAttr('checked');
}

/* orders/index.html.erb */
$j(document).ready(function(){
    $j('a.basic').cluetip({width: 400, arrows: true});
});

