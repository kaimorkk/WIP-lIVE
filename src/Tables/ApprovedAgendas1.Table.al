Table 52193749 "Approved Agendas1"
{

    fields
    {
        field(1; "Meeting No."; Code[10])
        {
            NotBlank = true;
            ////TableRelation = Table51076 where (Field1=field("Meeting No."));

            trigger OnValidate()
            begin
                if SetAgenda.Get("Meeting No.") then

                    //"Line No":=SetAgenda."Line No";
                    // Number:=Number+1;
                    "Agenda Description" := SetAgenda."Agenda Description";
            end;
        }
        field(2; Number; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Line No"; Integer)
        {
        }
        field(4; "Agenda Description"; Text[250])
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
        key(Key1; "Meeting No.", Number)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        SetAgenda: Record Agendas1;
}

