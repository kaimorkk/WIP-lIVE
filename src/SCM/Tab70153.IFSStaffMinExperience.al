
table 70153 "IFS Staff Min Experience"
{
    Caption = 'IFS Staff Min Experience';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "IFS Code"; Code[50])
        {
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Project Role Code"; Code[50])
        {
            TableRelation = "Project Role Code"."Project Role Code";
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Experience Category"; Option)
        {
            OptionCaption = ',General Experience,Specialized Experience,Training Experience,No. of Handled Projects,Other Experience';
            OptionMembers = ,"General Experience","Specialized Experience","Training Experience","No. of Handled Projects","Other Experience";
        }
        field(5; "Minimum Years of Experience"; Decimal)
        {
        }
        field(6; "Minimum Experience Req"; Text[100])
        {
            Caption = 'Minimum Experience Requirements';
        }
    }

    keys
    {
        key(Key1; "IFS Code", "Project Role Code", "Entry No")
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

