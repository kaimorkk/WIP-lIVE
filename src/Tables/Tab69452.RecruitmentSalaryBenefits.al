table 69452 "Recruitment Salary Benefits"
{
    Caption = 'Recruitment Salary Benefits';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Salary Scale"; Code[10])
        {
            TableRelation = "Salary Scales";
        }
        field(2; "Salary Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer";
        }
        field(3; "ED Code"; Code[10])
        {
            TableRelation = "PR Transaction Codes";


        }
        field(4; Amount; Decimal)
        {
        }
        field(5; "ED Description"; Text[30])
        {
        }
        field(6; "G/L Account"; Code[20])
        {
        }
        field(7; "Basic Salary"; Boolean)
        {
        }
        field(8; "Percentage"; Decimal)
        {

        }
        field(9; "Based On"; Option)
        {
            OptionMembers = Amount,Percentage;
            OptionCaption = 'Flat Amount,Percentage of Gross';
        }
        field(10; "Document No"; Code[20])
        {
        }

    }

    keys
    {
        key(Key1; "Document No", "ED Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EarningRec: Record "PR Transaction Codes";
}

