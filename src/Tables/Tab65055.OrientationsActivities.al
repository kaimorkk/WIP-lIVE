table 65055 "Orientations Activities"
{
    Caption = 'Orientations Activities';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[50])
        {
            Caption = 'Document No.';
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
            AutoIncrement = true;
        }
        field(3; "Content/Course"; Text[2000])
        {
            Caption = 'Content/Course';
        }
        field(4; Objectives; Text[2000])
        {
            Caption = 'Objectives';
        }
        field(5; Facilitator; Code[30])
        {
            Caption = 'Facilitator';
            TableRelation = resource."No." where(Type = filter(Person));
            trigger onvalidate()
            var
                myInt: Integer;
                resource: Record resource;

            begin

                resource.Reset();
                resource.SetRange("No.", Facilitator);
                if resource.FindSet() then begin
                    "Facilitator Name" := resource.Name;

                end;

            end;
        }
        field(6; "Facilitator Name"; Text[250])
        {
            Caption = 'Facilitator Name';
            Editable = false;
        }
        field(7; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(8; "Start Time"; Time)
        {
            Caption = 'Start Time';
        }
        field(9; "End Time"; Time)
        {
            Caption = 'End Time';
        }
        field(10; Remarks; Text[2000])
        {
            Caption = 'Remarks';
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No")
        {
            Clustered = true;
        }
    }
}
