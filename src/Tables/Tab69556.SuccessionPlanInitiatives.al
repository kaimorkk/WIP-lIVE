
table 69556 "Succession Plan Initiatives"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
        }
        field(2; "Employee No"; Code[30])
        {
            TableRelation = Employee."No.";
        }
        field(3; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Initiative Category"; Code[50])
        {
            TableRelation = "Succession Template Category".Code;
        }
        field(5; Initiative; Text[250])
        {
        }
        field(6; "Planned Start Date"; Date)
        {
        }
        field(7; "Planned End Date"; Date)
        {

            trigger OnValidate()
            begin
                if "Planned End Date" < "Planned Start Date" then
                    Error('Planned End date must be greater than Start Date');
            end;
        }
        field(8; "Responsible Officer"; Code[10])
        {
            TableRelation = Resource."No." where(Type = const(Person),
                                                  Blocked = const(false));
        }
        field(9; Status; Option)
        {
            OptionCaption = 'Planned,Pending,Ongoing,Completed';
            OptionMembers = Planned,Pending,Ongoing,Completed;
        }
        field(10; "Actual Start Date"; Date)
        {
        }
        field(11; "Actual End Date"; Date)
        {

            trigger OnValidate()
            begin
                // IF "Actual End Date"< "Actual Start Date" THEN
                //  ERROR('Actual End date must be greater than start date');
            end;
        }
        field(12; Remarks; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Employee No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

