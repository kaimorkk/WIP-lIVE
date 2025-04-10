
table 95140 "Risk Incident Ledger Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Posting Date"; Date)
        {
        }
        field(3; "Posted By"; Code[50])
        {
        }
        field(4; "Incident Document Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(5; "HSE Management Plan ID"; Code[20])
        {
        }
        field(6; "Hazard ID"; Integer)
        {
        }
        field(7; "Risk Management Plan ID"; Code[20])
        {
        }
        field(8; "Risk ID"; Integer)
        {
        }
        field(9; "Risk Incident Category"; Code[20])
        {
        }
        field(10; "Source Document Type"; Option)
        {
            OptionCaption = ' ,Risk Incident Log,Risk Status Report';
            OptionMembers = " ","Risk Incident Log","Risk Status Report";
        }
        field(11; "Source Document No."; Code[20])
        {
        }
        field(12; "Incident Reference ID"; Code[20])
        {
        }
        field(13; "Incident Description"; Text[2048])
        {
        }
        field(14; "Severity Level"; Code[20])
        {
        }
        field(15; "Occurrence Type"; Option)
        {
            OptionCaption = ' ,Occurred,Near-Miss';
            OptionMembers = " ",Occurred,"Near-Miss";
        }
        field(16; "Incident Date"; Date)
        {
        }
        field(17; "Incident Start Time"; Time)
        {
        }
        field(18; "Incident End Time"; Time)
        {
        }
        field(19; "Incident Location Details"; Text[2048])
        {
        }
        field(20; "Primary Trigger ID"; Code[20])
        {
        }
        field(21; "Root Cause Summary"; Text[2048])
        {
        }
        field(22; "Category of Person Reporting"; Option)
        {
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(23; "Reported By (Name)"; Text[250])
        {
        }
        field(24; "Actual Financial Impact (LCY)"; Decimal)
        {
        }
        field(25; "Actual Schedule Delay(Days)"; Integer)
        {
            Description = 'Actual Schedule Delay/Service Disruption (Days)';
        }
        field(26; "Actual No. Injured Persons"; Integer)
        {
        }
        field(27; "Actual No. of Fatalities"; Integer)
        {
        }
        field(28; "Police Report Reference No."; Code[52])
        {
        }
        field(29; "Police Report Date"; Date)
        {
        }
        field(30; "Police Station"; Text[100])
        {
        }
        field(31; "Reporting Officer"; Text[100])
        {
        }
        field(32; "Incident Class"; Option)
        {
            OptionCaption = ' ,General Incident,Health/Safety/Environment Incident';
            OptionMembers = " ","General Incident","Health/Safety/Environment Incident";
        }
        field(33; "Project ID"; Code[50])
        {
        }
        field(34; "Work Execution Plan ID"; Code[20])
        {
        }
        field(35; "Corporate Strategic Plan ID"; Code[20])
        {
        }
        field(36; "Year Code"; Code[20])
        {
        }
        field(37; "Directorate ID"; Code[20])
        {
        }
        field(38; "Department ID"; Code[20])
        {
        }
        field(39; "Region ID"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

