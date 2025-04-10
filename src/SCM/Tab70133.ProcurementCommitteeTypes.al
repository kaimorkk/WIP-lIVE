
table 70133 "Procurement Committee Types"
{
    DrillDownPageID = "Procurement Committee Types";
    LookupPageID = "Procurement Committee Types";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Committee Type"; Code[20])
        {
        }
        field(2; "Title of Appointing Officer"; Text[50])
        {
        }
        field(3; "Non-Staff Allowed"; Boolean)
        {
        }
        field(4; "Min. No. of Members"; Decimal)
        {
            CalcFormula = sum("Procurement Comm Composition"."Minimum No. of Members" where("Committee Type" = field("Committee Type"),
                                                                                             Role = filter(<> Secretary)));
            Description = 'Un-editable SUM calcfield field that links to the Procurement Comm Composition Table and sums the min. number of members required based on the composition';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; Blocked; Boolean)
        {
        }
        field(6; "Mandate Type"; Option)
        {
            OptionCaption = 'Tender Opening,Tender Evaluation,Inspection & Acceptance,Asset Disposal,Tender Committee,Procurement Committee,Other';
            OptionMembers = "Tender Opening","Tender Evaluation","Inspection & Acceptance","Asset Disposal","Tender Committee","Procurement Committee",Other;
        }
        field(7; Description; Text[80])
        {
        }
        field(8; "No. of Appointments Made"; Integer)
        {
        }
        field(9; "Inspection Committee"; boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Committee Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

