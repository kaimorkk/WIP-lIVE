
table 70149 "IFS Purchase Activity Schedule"
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
            TableRelation = "PP Purchase Activity Schedule"."PP Entry";
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
        field(6; "Default Planned Duration(Days)"; Decimal)
        {
            Description = 'Default Planned Duration (Days)';
        }
        field(7; "Actual Duration (Days)"; Decimal)
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
            AutoIncrement = true;
        }
        field(11; "Solicitation Type"; Code[30])
        {
            TableRelation = "Solicitation Type".Code;
        }
        field(12; "Activity Description"; Text[50])
        {
        }
        field(13; "Document No"; Code[30])
        {
            TableRelation = "Standard Purchase Code";
        }
    }

    keys
    {
        key(Key1; "Document No", "Procurement Plan ID", "PP Entry", "Planning Category", "Line no")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Activity: Record "Procurement Activity Code";
}

