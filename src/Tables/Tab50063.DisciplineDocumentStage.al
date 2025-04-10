table 50063 "Discipline Document Stage"
{
    Caption = 'Discipline Document Stage';
    DataClassification = CustomerContent;
    LookupPageId = "Discipline Document Stage";
    DrillDownPageId = "Discipline Document Stage";

    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "Attachment Type"; Option)
        {
            OptionMembers = " ","Disciplinary Case Summary","Termination of Case","Show Cause Letter","Charging Letter","Dismissal Letter","Reinstatement Letter","Reprimand Letter",Interdiction;
            Caption = 'Documents To Be Sent';
        }
        field(4; "Email Recepient"; Text[1000])
        {
            Caption = 'Email Recepient';
        }
        field(5; "Stage No."; Integer)
        {
            Caption = 'Stage No.';
        }
        field(6; "Requires CJ Remarks"; Boolean)
        {
            Caption = 'Requires CJs Remarks';
        }
        field(7; "Requires Email Notification"; Boolean)
        {
            Caption = 'Requires Email Notification';
        }
        field(8; "Email To"; Option)
        {
            OptionMembers = " ","Disciplinary Team",Complainant,"Chief Justice","Accused Employee","Disciplinary Team & Accused";
        }

        field(9; "Email Reminder Period"; DateFormula)
        {
        }

    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
        key(sortingKey; "Stage No.")
        {

        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Code, Description, "Stage No.") { }
    }
}
