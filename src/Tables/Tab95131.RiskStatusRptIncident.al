
table 95131 "Risk Status Rpt Incident"
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
            AutoIncrement = true;
        }
        field(5; "Risk Incident Category"; Code[20])
        {
        }
        field(6; "Incident Description"; Text[2048])
        {
        }
        field(7; "Severity Level"; Code[20])
        {
        }
        field(8; "Occurrence Type"; Option)
        {
            OptionCaption = ' ,Occurred,Near-Miss';
            OptionMembers = " ",Occurred,"Near-Miss";
        }
        field(9; "Incident Date"; Date)
        {
        }
        field(10; "Incident Start Time"; Time)
        {
        }
        field(11; "Incident End Time"; Time)
        {
        }
        field(12; "Incident Location Details"; Text[2048])
        {
        }
        field(13; "Primary Trigger ID"; Code[20])
        {
        }
        field(14; "Root Cause Summary"; Text[2048])
        {
        }
        field(15; "Category of Person Reporting"; Option)
        {
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(16; "Reported By (Name)"; Text[100])
        {
        }
        field(17; "Risk Management Plan ID"; Code[20])
        {
        }
        field(18; "HSE Plan ID"; Code[20])
        {
        }
        field(19; "Hazard ID"; Integer)
        {
        }
        field(20; "Actual Financial Impact (LCY)"; Decimal)
        {
        }
        field(21; "Actual Schedule Delay(Days)"; Integer)
        {
            Description = 'Actual Schedule Delay/Service Disruption (Days)';
        }
        field(22; "Actual No. Injured Persons"; Integer)
        {
        }
        field(23; "Actual No. of Fatalities"; Integer)
        {
        }
        field(24; "Police Report Reference No."; Code[50])
        {
        }
        field(25; "Police Report Date"; Date)
        {
        }
        field(26; "Police Station"; Text[250])
        {
        }
        field(27; "Reporting Officer"; Text[250])
        {
        }
        field(28; "Risk Register Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk Register Type", "Risk Management Plan ID", "Risk ID", "Incident Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

