
table 59021 "Non-KeRRA Driver Allocation"
{

    fields
    {
        field(1; "Req No"; Code[20])
        {
        }
        field(2; "ID No"; Code[20])
        {
        }
        field(3; "Driver Name"; Text[70])
        {
        }
        field(4; "DL Number"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Daily Work Ticket"; Code[20])
        {

            trigger OnValidate()
            begin
                DwTicket.Reset;
                DwTicket.SetRange(DwTicket."Transport Requisition No", "Req No");
                if DwTicket.Find('-') then
                    "Daily Work Ticket" := DwTicket."Work Ticket No";
            end;
        }
        field(6; EntryNo; Integer)
        {
            AutoIncrement = true;
        }
        field(7; "Phone Number"; Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Email Address"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Vehicle Registration No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fleet Vehicle Allocation"."Vehicle Req. No" where("Transport Requisition No" = field("Req No"));
        }
    }

    keys
    {
        key(Key1; "Req No", "ID No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HrEmployee: Record Employee;
        DwTicket: Record "Transport Requisition";
}

