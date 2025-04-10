
table 95132 "Risk Status Rpt Inc. Impact"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,New Risk Voucher,Risk Status Report';
            OptionMembers = " ","New Risk Voucher","Risk Status Report";
        }
        field(2; "Document No"; Code[20])
        {
        }
        field(3; "Risk ID"; Integer)
        {
            AutoIncrement = false;
        }
        field(4; "Incident Line No."; Integer)
        {
        }
        field(5; "Impact Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(6; "Impact Type"; Option)
        {
            OptionCaption = ' ,Injury,Fatality (Death),Financial Loss,Schedule Delay/Service Disruption(Days)';
            OptionMembers = " ",Injury,"Fatality (Death)","Financial Loss","Schedule Delay/Service Disruption(Days)";
        }
        field(7; Description; Text[2048])
        {
        }
        field(8; "Unit of Measure"; Code[20])
        {
        }
        field(9; Quantity; Decimal)
        {
        }
        field(10; "Category of Party Affected"; Option)
        {
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(11; "Internal Employee No."; Code[20])
        {
        }
        field(12; Name; Text[100])
        {
        }
        field(13; "Contact Details"; Text[100])
        {
        }
        field(14; "Additional Comments"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk ID", "Incident Line No.", "Impact Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

