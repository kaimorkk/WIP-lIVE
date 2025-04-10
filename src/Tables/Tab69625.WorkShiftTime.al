
table 69625 "Work Shift Time"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Workshift Code"; Code[30])
        {
            TableRelation = "Employee Work Shift";
        }
        field(3; Day; Option)
        {
            OptionCaption = 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
            OptionMembers = Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday;
        }
        field(4; "Deployment Type"; Option)
        {
            OptionCaption = 'Onsite,Remote';
            OptionMembers = Onsite,Remote;
        }
        field(5; "Start Time"; Time)
        {
        }
        field(6; "End Time"; Time)
        {
        }
        field(7; "Minimum Work Hrs/Day"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Line No.", "Workshift Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

