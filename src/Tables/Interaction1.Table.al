Table 52193810 Interaction1
{

    fields
    {
        field(1;"Interaction No.";Code[20])
        {
        }
        field(2;"Interaction Type";Option)
        {
            OptionMembers = " ",Request,Complaint;
        }
        field(3;"Interaction Channel";Code[10])
        {
        }
        field(4;Name;Text[60])
        {
        }
        field(5;Telephone;Text[30])
        {
        }
        field(6;"E-mail";Text[60])
        {
        }
        field(7;CellPhone;Text[30])
        {
        }
        field(8;Address;Text[30])
        {
        }
        field(9;"Nature of Complaint";Text[250])
        {
        }
        field(10;"Mode of Receipt";Text[30])
        {
        }
        field(11;"Name of Receiving Officer";Text[60])
        {
        }
        field(12;"Department Allocated";Code[10])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(13;Status;Option)
        {
            OptionMembers = " ",Open,Assigned,Closed;
        }
        field(14;"Date Received at Department";Date)
        {
        }
        field(15;"Date and Time";DateTime)
        {
        }
        field(16;"Date Recorded";Date)
        {
        }
        field(17;"Time Recorded";Time)
        {
        }
        field(18;"Closing Date";Date)
        {
        }
        field(19;"No. Series";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Interaction No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Interaction No." = '' then begin
          RMSetup.Get;
          RMSetup.TestField(RMSetup."Complains Nos");
          NoSeriesMgt.InitSeries(RMSetup."Complains Nos",xRec."No. Series",0D,"Interaction No.","No. Series");
        end;
        "Date Recorded":=Today;
        "Time Recorded":=Time;
        "Date and Time":=CurrentDatetime;
        "Name of Receiving Officer":=UserId;
        Status:=Status::Open;
    end;

    var
        RMSetup: Record "Marketing Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

