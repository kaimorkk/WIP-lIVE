table 69458 "Transfer Reasons"
{
    Caption = 'Transfer Reasons';
    DataClassification = CustomerContent;
    DrillDownPageId = "Transfer Reasons";
    LookupPageId = "Transfer Reasons";

    fields
    {
        field(1; "Reason Code"; Code[40])
        {
            Caption = 'Reason Code';
        }
        field(2; Description; Text[2000])
        {
            Caption = 'Description';
        }
        field(30; "Applicable Area"; Option)
        {
            OptionCaption = 'Application,Employee Requisition';
            OptionMembers = Application,"Employee Requisition";
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Reason Code")
        {
            Clustered = true;
        }
    }
}
