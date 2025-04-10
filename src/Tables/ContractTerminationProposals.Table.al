Table 52193973 "Contract Termination Proposals"
{

    fields
    {
        field(1;No;Integer)
        {
            AutoIncrement = false;
        }
        field(2;Description;Text[250])
        {
        }
        field(3;"Contract Code";Code[20])
        {
            TableRelation = Contract."Contract No";

            trigger OnValidate()
            begin
                /*
                IF "Conveyance Code" <> xRec."Conveyance Code" THEN BEGIN
                  SalesSetup.GET;
                  NoSeriesMgt.TestManual(SalesSetup."Conveyance Nos");
                  "No. Series" := '';
                END;
                */

            end;
        }
    }

    keys
    {
        key(Key1;No,"Contract Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
          TerminationProposals.Reset;
          TerminationProposals.SetRange(TerminationProposals."Contract Code","Contract Code");
          if TerminationProposals.Find('+') then
           No:=TerminationProposals.No+1;
    end;

    var
        TerminationProposals: Record "Contract Termination Proposals";
}

