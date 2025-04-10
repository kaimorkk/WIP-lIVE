table 52194111 "Leave Journal Voucher"
{
    Caption = 'Leave Journal Voucher';
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
            Editable = false;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "Batch Name"; Code[20])
        {
            Caption = 'Batch Name';
            TableRelation = "HR Leave Journal Batch".Name where("Journal Template Name" = field("Template Name"));

        }
        field(4; "Template Name"; Code[20])
        {
            Caption = 'Template Name';
            TableRelation = "HR Leave Journal Template";
        }
        field(5; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;

        }
        field(6; "No. Series"; Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(7; Posted; Boolean)
        {
        }

    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin


        if No = '' then begin
            NoSetup.Get;
            NoSetup.TestField(NoSetup."Leave Adjustment Nos.");
            NoSeriesMgt.InitSeries(NoSetup."Leave Adjustment Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;
    end;

    var
        NoSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

}
