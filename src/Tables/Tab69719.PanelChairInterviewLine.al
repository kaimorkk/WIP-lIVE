
table 69719 "Panel Chair Interview Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = 'Interview Invitation,Candidate Shortlisting,Consolidated Interview Report';
            OptionMembers = "Interview Invitation","Candidate Shortlisting","Consolidated Interview Report";
        }
        field(2; "Document No."; Code[30])
        {
        }
        field(3; "Interview Invitation No."; Code[30])
        {
        }
        field(4; "Application No."; Code[30])
        {
        }
        field(5; "Candidate No."; Code[30])
        {
        }
        field(6; "First Name"; Text[50])
        {
        }
        field(7; "Middle Name"; Text[50])
        {
        }
        field(8; "Last Name"; Text[50])
        {
        }
        field(9; "Interview Panel Outcome"; Option)
        {
            Caption = 'Final Interview Panel Outcome';
            OptionCaption = ' ,Unsuccesful,Succesful';
            OptionMembers = " ",Unsuccesful,Succesful;
        }
        field(10; "Interview Panel Score %"; Decimal)
        {
            Caption = 'Final Interview Panel Score %';
        }
        field(11; "Interview Panel Remarks"; Text[350])
        {
        }
        field(12; "Unsuccesful Application Reason"; Code[30])
        {
        }
        field(13; "Interview Date"; Date)
        {
        }
        field(14; "Interview Start Time"; Time)
        {
        }
        field(15; "Interview End Time"; Time)
        {
        }
        field(16; "Assigned Panel ID"; Code[30])
        {
        }
        field(17; "Interview Venue"; Text[300])
        {
        }
        field(18; "Room No."; Code[30])
        {
        }
        field(19; "Candidate Attendance Status"; Option)
        {
            OptionCaption = 'Pending Confirmation,Confirmed,Confirmed with Reschedule Request,Cancelled';
            OptionMembers = "Pending Confirmation",Confirmed,"Confirmed with Reschedule Request",Cancelled;
        }
        field(20; "Vacancy ID"; Code[30])
        {
        }
        field(21; "Candidate Shortlist Voucher"; Code[30])
        {
        }
        field(23; "Phone No."; Text[30])
        {
        }
        field(24; "Mobile Phone No."; Text[30])
        {
        }
        field(25; Email; Text[30])
        {
        }
        field(26; "Birth Date"; Date)
        {
        }
        field(27; Gender; Option)
        {
            OptionCaption = 'Female,Male,Other';
            OptionMembers = Female,Male,Other;
        }
        field(28; "ID Number"; Integer)
        {
        }
        field(29; "Passport No."; Code[20])
        {
        }
        field(30; "Tax Registration(PIN)"; Code[20])
        {
        }
        field(31; "Marital Status"; Option)
        {
            OptionCaption = ' ,Single,Married,Widowed,Separated,Divorced';
            OptionMembers = " ",Single,Married,Widowed,Separated,Divorced;
        }
        field(32; Religion; Code[30])
        {
        }
        field(33; "Ethnic Group"; Code[30])
        {
        }
        field(34; Nationality; Code[30])
        {
        }
        field(35; "Specialization Area"; Code[30])
        {
        }
        field(36; "Highest Academic Qualification"; Code[30])
        {
        }
        field(37; "Academic Qualification Name"; Text[50])
        {
        }
        field(38; "Highest Academic Pointer"; Integer)
        {
        }
        field(39; "General Work Experience Yrs"; Integer)
        {
        }
        field(40; "Management Experience Yrs"; Integer)
        {
        }
        field(41; "Disability Code"; Code[30])
        {
        }
        field(42; Disabled; Boolean)
        {
        }
        field(43; "Disability Description"; Text[100])
        {
        }
        field(44; "Disability Cert No."; Code[30])
        {
        }
        field(45; Notified; Boolean)
        {
        }
        field(46; "Notified On"; DateTime)
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Interview Invitation No.", "Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

