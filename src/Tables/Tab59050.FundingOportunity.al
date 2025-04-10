
table 59050 "Funding Oportunity"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[50])
        {
        }
        field(2; Name; Code[50])
        {
        }
        field(3; "Donor Type"; Option)
        {
            OptionCaption = 'Internal,External';
            OptionMembers = Internal,External;
        }
        field(4; "Donor No"; Code[50])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if Cust.Get("Donor No") then
                    "Donor Name" := Cust.Name;
            end;
        }
        field(5; Amount; Decimal)
        {
        }
        field(6; "Date Awarded"; Date)
        {
        }
        field(7; "Total Amount Applied"; Decimal)
        {
            CalcFormula = sum("Internal Grants Application"."Amount Applied" where("Fund Opportunity" = field(No)));
            FieldClass = FlowField;
        }
        field(8; Closed; Boolean)
        {
        }
        field(9; Open; Boolean)
        {
        }
        field(10; Status; Option)
        {
            OptionCaption = 'Open,Pending,Approved,Cancelled,Rejected';
            OptionMembers = Open,Pending,Approved,Cancelled,Rejected;
        }
        field(11; "Donor Name"; Code[100])
        {
        }
        field(12; "Eligibility Criteria"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Cust: Record Customer;
}

