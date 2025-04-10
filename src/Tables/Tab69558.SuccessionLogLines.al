
table 69558 "Succession  Log Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
        }
        field(2; "Employee No"; Code[20])
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
        field(6; "Actual Start Date"; Date)
        {
        }
        field(7; "Actual End Date"; Date)
        {

            trigger OnValidate()
            begin
                if "Actual End Date" < "Actual Start Date" then
                    Error('Actual End date must be greater than start date');
            end;
        }
        field(8; "Responsible Officer"; Code[30])
        {
            TableRelation = Resource."No." where(Type = const(Person),
                                                  Blocked = const(false));
        }
        field(9; "Position ID"; Code[30])
        {
            TableRelation = "Company Positions"."Position ID";
        }
        field(10; Status; Option)
        {
            OptionCaption = 'Planned,Pending,Ongoing,Completed';
            OptionMembers = Planned,Pending,Ongoing,Completed;
        }
        field(11; Remarks; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

