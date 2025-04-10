
table 95157 "Risk Incident Log Impact M"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Incident No"; Code[10])
        {
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Impact Type"; Option)
        {
            OptionCaption = ' ,Injury,Fatality (Death),Financial Loss,Schedule Delay/Service Disruption(Days)';
            OptionMembers = " ",Injury,"Fatality (Death)","Financial Loss","Schedule Delay/Service Disruption(Days)";
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Unit Of Measure"; Code[20])
        {
        }
        field(6; Quantity; Decimal)
        {
        }
        field(7; "Category of Party Affected"; Option)
        {
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(8; "Internal Employee No."; Code[20])
        {
            Description = 'Employee.No.';
        }
        field(9; Name; Text[100])
        {
        }
        field(10; "Contact Details"; Text[100])
        {
        }
        field(11; "Additional Comments"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Incident No", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

