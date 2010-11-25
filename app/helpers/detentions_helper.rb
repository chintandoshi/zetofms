module DetentionsHelper
    def populate_combo_with_detentionreasons
     @reasons_list = DetentionReason.find(:all).map {|reason|
                             [reason.description, reason.id ]}
    end
end
