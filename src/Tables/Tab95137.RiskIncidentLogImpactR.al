
table 95137 "Risk Incident Log Impact R"
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
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Internal Employee No.");
                if Employee.FindSet then
                    Name := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
            end;
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
        field(12; "Police Report Reference No."; Code[20])
        {
        }
        field(13; "Police Report Date"; Date)
        {
        }
        field(14; "Police Station"; Text[100])
        {
        }
        field(15; "Reporting Officer"; Text[100])
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

    var
        Employee: Record Employee;
}

