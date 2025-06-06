
table 70166 "Bid Litigation History"
{
    Caption = 'Contact';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'Entry No.';
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Entry No."; Integer)
        {
            Caption = 'No.';
        }
        field(4; "Vendor No."; Text[100])
        {
            Caption = 'Name';
            TableRelation = Vendor;
        }
        field(5; "Dispute Matter"; Text[100])
        {
            Caption = 'Dispute Matter';
        }
        field(6; "Other Dispute Party"; Text[100])
        {
        }
        field(7; "Dispute Amount LCY"; Decimal)
        {
        }
        field(8; "Category of Matter"; Option)
        {
            OptionCaption = ',Litigation,Arbitration,Mediation';
            OptionMembers = ,Litigation,Arbitration,Mediation;
        }
        field(9; Year; Code[10])
        {
            //TableRelation = "Calendar Year Code".Code;
        }
        field(10; "Award Type"; Option)
        {
            OptionCaption = ',Pending verdict,Won,Lost';
            OptionMembers = ,"Pending verdict",Won,Lost;
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Entry No.")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Document Type", "No.", "Dispute Amount LCY", Year)
        {
        }
        fieldgroup(Brick; "Document Type", "No.", "Dispute Amount LCY", Year)
        {
        }
    }

    trigger OnDelete()
    var
        Task: Record "To-do";
        SegLine: Record "Segment Line";
        ContIndustGrp: Record "Contact Industry Group";
        ContactWebSource: Record "Contact Web Source";
        ContJobResp: Record "Contact Job Responsibility";
        ContMailingGrp: Record "Contact Mailing Group";
        ContProfileAnswer: Record "Contact Profile Answer";
        RMCommentLine: Record "Rlshp. Mgt. Comment Line";
        ContAltAddr: Record "Contact Alt. Address";
        ContAltAddrDateRange: Record "Contact Alt. Addr. Date Range";
        InteractLogEntry: Record "Interaction Log Entry";
        Opp: Record Opportunity;
        Cont: Record Contact;
        ContBusRel: Record "Contact Business Relation";
        IntrastatSetup: Record "Int. Table Config Template";
        CampaignTargetGrMgt: Codeunit "Campaign Target Group Mgt";
        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
    begin
    end;

    var
        CannotDeleteWithOpenTasksErr: label 'You cannot delete contact %1 because there are one or more tasks open.', Comment = '%1 = Contact No.';
        Text001: label 'You cannot delete the %2 record of the %1 because the contact is assigned one or more unlogged segments.';
        Text002: label 'You cannot delete the %2 record of the %1 because one or more opportunities are in not started or progress.';
        Text003: label '%1 cannot be changed because one or more interaction log entries are linked to the contact.';
        CannotChangeWithOpenTasksErr: label '%1 cannot be changed because one or more tasks are linked to the contact.', Comment = '%1 = Contact No.';
        Text006: label '%1 cannot be changed because one or more opportunities are linked to the contact.';
        Text007: label '%1 cannot be changed because there are one or more related people linked to the contact.';
        RelatedRecordIsCreatedMsg: label 'The %1 record has been created.', Comment = 'The Customer record has been created.';
        Text010: label 'The %2 record of the %1 is not linked with any other table.';
        RMSetup: Record "Marketing Setup";
        Salesperson: Record "Salesperson/Purchaser";
        PostCode: Record "Post Code";
        DuplMgt: Codeunit DuplicateManagement;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UpdateCustVendBank: Codeunit "CustVendBank-Update";
        CampaignMgt: Codeunit "Campaign Target Group Mgt";
        ContChanged: Boolean;
        SkipDefaults: Boolean;
        Text012: label 'You cannot change %1 because one or more unlogged segments are assigned to the contact.';
        Text019: label 'The %2 record of the %1 already has the %3 with %4 %5.';
        CreateCustomerFromContactQst: label 'Do you want to create a contact as a customer using a customer template?';
        Text021: label 'You have to set up formal and informal salutation formulas in %1  language for the %2 contact.';
        Text022: label 'The creation of the customer has been aborted.';
        Text033: label 'Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.';
        SelectContactErr: label 'You must select an existing contact.';
        AlreadyExistErr: label '%1 %2 already has a %3 with %4 %5.', Comment = '%1=Contact table caption;%2=Contact number;%3=Contact Business Relation table caption;%4=Contact Business Relation Link to Table value;%5=Contact Business Relation number';
        HideValidationDialog: Boolean;
        PrivacyBlockedPostErr: label 'You cannot post this type of document because contact %1 is blocked due to privacy.', Comment = '%1=contact no.';
        PrivacyBlockedCreateErr: label 'You cannot create this type of document because contact %1 is blocked due to privacy.', Comment = '%1=contact no.';
        PrivacyBlockedGenericErr: label 'You cannot use contact %1 because they are marked as blocked due to privacy.', Comment = '%1=contact no.';
        ParentalConsentReceivedErr: label 'Privacy Blocked cannot be cleared until Parental Consent Received is set to true for minor contact %1.', Comment = '%1=contact no.';
        ProfileForMinorErr: label 'You cannot use profiles for contacts marked as Minor.';
}

