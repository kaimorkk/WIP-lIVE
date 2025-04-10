
table 59051 "Internal Grants Application"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[50])
        {
        }
        field(2; "Fund Opportunity"; Code[50])
        {
            TableRelation = "Funding Oportunity";

            trigger OnValidate()
            begin
                if FundOp.Get("Fund Opportunity") then
                    "Fund Name" := FundOp.Name;
            end;
        }
        field(3; "Fund Name"; Code[100])
        {
        }
        field(4; "PI No"; Code[30])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if emp.Get("PI No") then
                    "PI Name" := emp."First Name" + ' ' + emp."Middle Name" + ' ' + emp."Last Name";
            end;
        }
        field(5; "PI Name"; Code[100])
        {
        }
        field(6; "Amount Applied"; Decimal)
        {
        }
        field(7; "Application Send"; Boolean)
        {
        }
        field(10; Status; Option)
        {
            OptionCaption = 'Open,Pending,Approved,Cancelled,Rejected';
            OptionMembers = Open,Pending,Approved,Cancelled,Rejected;
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
        emp: Record Employee;
        FundOp: Record "Funding Oportunity";
}

