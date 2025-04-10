table 50126 "HR Leave Handover Notes"
{
    Caption = 'HR Leave Handover Notes';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Leave No."; Code[20])
        {
            Caption = 'Leave No.';
            TableRelation = "HR Leave Application"."Application Code";
            trigger Onvalidate()
            var
                LeaveApp: Record "HR Leave Application";
            begin
                if LeaveApp.get("Leave No.") then Begin
                    "Employee No." := LeaveApp."Employee No";
                    "Reliever No." := LeaveApp.Reliever;
                End
            end;
        }
        field(2; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
        }
        field(3; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = ,"Handover Taks","Handover Files";
        }
        field(4; Activity; Text[2000])
        {
            Caption = 'Activity';
        }
        field(5; Status; Text[2000])
        {
            Caption = 'Status';
        }
        field(6; Reason; Text[2000])
        {
            Caption = 'Reason';
        }
        field(7; "Employee No."; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(8; "Reliever No."; Code[20])
        {
            TableRelation = Employee."No.";
        }
    }
    keys
    {
        key(PK; "Leave No.", "Entry No", "Type")
        {
            Clustered = true;
        }
    }
}
