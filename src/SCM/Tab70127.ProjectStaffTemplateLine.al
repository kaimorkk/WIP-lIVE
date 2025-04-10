
table 70127 "Project Staff Template Line"
{
    DrillDownPageID = "Project Staff Template Line";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Key Staff Template ID"; Code[50])
        {
            TableRelation = "Project Key Staff Template";
        }
        field(2; "Project Role Code"; Code[50])
        {
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "Staff Category"; Option)
        {
            OptionCaption = ',Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Other';
            OptionMembers = ,"Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Other;
        }
        field(5; "Min No. of Recomm Staff"; Integer)
        {
            Description = 'Minimum No. of Recommended Staff';
        }
    }

    keys
    {
        key(Key1; "Key Staff Template ID", "Project Role Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
}

