table 50043 "Induction Curriculum"
{
    Caption = 'Induction Curriculum';
    DataClassification = CustomerContent;
    //LookupPageId = "Induction Objectives";
    fields
    {
        field(1; "Induction No."; Code[20])
        {
            Caption = 'Induction No.';
        }
        field(2; Objective; Text[200])
        {

            Caption = 'Objective';
        }
        field(3; Activity; Text[200])
        {
            Caption = 'Activity';
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
            Editable = false;
        }
        field(5; Type; Option)
        {
            OptionCaption = 'Objective,Activity';
            OptionMembers = Objective,Activity;
        }
        field(6; Facilitator; Code[20])
        {
            TableRelation = Resource;
            trigger OnValidate()
            var
                Res: Record Resource;
            begin
                if Res.Get(Facilitator) then
                    "Facilitator Name" := Res.Name;

            end;
        }
        field(7; "Facilitator Name"; Text[100])
        {
        }
        field(8; "Start Date"; Date)
        {
        }



        field(9; "End Date"; Date)
        {
        }

        field(10; "Objective Start Date"; Date)
        {

            FieldClass = FlowField;
            CalcFormula = min("Induction Curriculum"."Start Date" where(Type = const(Activity), Objective = field(Objective), "Induction No." = field("Induction No.")));
        }
        field(11; "Objective End Date"; Date)
        {

            FieldClass = FlowField;
            CalcFormula = max("Induction Curriculum"."End Date" where(Type = const(Activity), Objective = field(Objective), "Induction No." = field("Induction No.")));
        }
        field(12; "Start Time"; Time)
        {

        }
        field(13; "End Time"; Time)
        {

        }
    }
    keys
    {
        key(PK; "Induction No.", "Line No.", Objective)
        {
            Clustered = true;
        }
    }
}
