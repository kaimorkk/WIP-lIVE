
table 70151 "IFS Key Staff"
{
    Caption = 'IFS Key Staff';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "IFS Code"; Code[50])
        {
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Staff Role Code"; Code[50])
        {
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(3; "Title/Designation Description"; Text[100])
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
        field(6; "Requirement Type"; Option)
        {
            OptionCaption = 'Mandatory,Optional';
            OptionMembers = Mandatory,Optional;
        }
    }

    keys
    {
        key(Key1; "IFS Code", "Staff Role Code")
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

