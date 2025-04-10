Table 52193955 "Telephone Request Lines1"
{

    fields
    {
        field(1;"Request No";Code[20])
        {

            trigger OnValidate()
            begin
                if TelRec.Get("Request No") then
                    begin
                    "User ID":=TelRec."User ID";
                end;
            end;
        }
        field(2;"Line No";Integer)
        {
        }
        field(3;"Name of Firm/Person";Text[80])
        {
        }
        field(4;"Telephone No";Code[20])
        {
        }
        field(5;Reason;Text[150])
        {
        }
        field(6;"Contact No";Code[20])
        {
            TableRelation = Contact;

            trigger OnValidate()
            begin

                 if ContactRec.Get("Contact No") then
                 begin
                 "Name of Firm/Person":=ContactRec.Name;
                 "Telephone No":=ContactRec."Phone No.";

                 end;
            end;
        }
        field(8;"User ID";Code[20])
        {
        }
        field(9;Called;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Request No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ContactRec: Record Contact;
        TelRec: Record "Telephone Request1";
}

