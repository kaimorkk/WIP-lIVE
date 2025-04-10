table 70102 "PP Purchase Activity Schedule"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Procurement Plan ID"; Code[30])
        {
            TableRelation = "Procurement Plan".Code;
        }
        field(2; "PP Entry"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Planning Category"; Code[50])
        {
            TableRelation = "Procurement Category".Code;
        }
        field(4; "Procurement Method"; Option)
        {
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(5; "Activity Code"; Code[30])
        {
            TableRelation = "Procurement Activity Code"."Activity Code";

            trigger OnValidate()
            begin
                Activity.Reset;
                Activity.SetRange("Activity Code", "Activity Code");
                if Activity.FindSet then
                    "Activity Description" := Activity.Description
            end;
        }
        field(6; "Planned Days"; Decimal)
        {
        }
        field(7; "Actual Days"; Decimal)
        {
        }
        field(8; "Planned Dates"; Date)
        {
        }
        field(9; "Actual Dates"; Date)
        {
        }
        field(10; "Line no"; Integer)
        {
        }
        field(11; "Solicitation Type"; Code[30])
        {
            TableRelation = "Solicitation Type".Code;
        }
        field(12; "Activity Description"; Text[50])
        {
        }
        field(70000; "Document Type"; Option)
        {
            OptionCaption = 'Procurement Plan,Revision Voucher';
            OptionMembers = "Procurement Plan","Revision Voucher";
        }
    }

    keys
    {
        key(Key1; "Procurement Plan ID", "PP Entry", "Planning Category", "Line no")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
    trigger OnModify()
    var
        myInt: Integer;
        Procplan: record "Procurement Plan";
    begin
        if Rec."Procurement Plan ID" <> '' then begin
            Procplan.Reset();
            Procplan.SetRange(Code, Rec."Procurement Plan ID");
            Procplan.SetRange("Approval Status", Procplan."Approval Status"::Open);
            if not Procplan.FindFirst() then begin
                Error('You are not allowed to modify a %1 Procurement plan', Procplan."Approval Status");
            end;
        end;


    end;

    var
        Activity: Record "Procurement Activity Code";
}

