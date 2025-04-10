Table 52193747 Agendas1
{
    // //DrillDownPageID = UnknownPage51075;
    // //LookupPageID = UnknownPage51075;

    fields
    {
        field(1; "Meeting No."; Code[10])
        {
            NotBlank = true;
            TableRelation = Campaign;
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; "Agenda Description"; Text[250])
        {
        }
        field(4; Number; Integer)
        {
        }
        field(5; User; Code[10])
        {
        }
        field(6; "User Name"; Text[30])
        {
        }
        field(7; "Send for Approval"; Boolean)
        {
        }
        field(8; Apporove; Boolean)
        {

            trigger OnValidate()
            begin
                /*if Approve=true then
                Status:=Status::approve
                  */

            end;
        }
        field(9; Status; Option)
        {
            OptionCaption = 'Open,Sent,Approve,Rejected';
            OptionMembers = Open,Sent,Approve,Rejected;
        }
        field(10; Reject; Boolean)
        {

            trigger OnValidate()
            begin

                /* if Reject=true then
                status:= Rejected
                   */

            end;
        }
    }

    keys
    {
        key(Key1; "Meeting No.", "Line No", Number)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Status = Status::Sent then
            Error('You Cannot Delete this Agenda, It has already been Sent');
    end;

    trigger OnModify()
    begin
        /*IF Status=Status::Sent THEN
        ERROR('You Cannot Modify this Agenda, It has already been Sent');
       */

    end;
}

