Table 52193447 Withdrawal
{

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    BosaSetup.Get;
                    NoSeriesMgt.TestManual(BosaSetup."Withdrawal No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Member No"; Code[20])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if Cust.Get("Member No") then
                    "Member Name" := Cust.Name;

                if "Member No" = '' then
                    "Member Name" := '';
            end;
        }
        field(3; Date; Date)
        {
        }
        field(4; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released,Canceled,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Canceled,Rejected;
        }
        field(5; "No. Series"; Code[30])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(6; "User ID"; Code[30])
        {
        }
        field(7; "Loans Guaranteed"; Integer)
        {
        }
        field(8; "Loans Guarantee"; Integer)
        {
        }
        field(9; "Member Name"; Text[50])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            BosaSetup.Get;
            BosaSetup.TestField("Withdrawal No.");
            NoSeriesMgt.InitSeries(BosaSetup."Withdrawal No.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if UserSetup.Get(UserId) then begin
            "User ID" := UserSetup."User ID";
        end;

        Date := Today;
    end;

    var
        BosaSetup: Record "Bosa Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Cust: Record Customer;
        MonContrib: Record "Monthly Contributions";
        OffsetContrib: Record "Share Transfer Lines";
        BosaProd: Record "Bosa Products";
        // OffsetLoan: Record "Offsetting Loans";
        UserSetup: Record "User Setup";
}

