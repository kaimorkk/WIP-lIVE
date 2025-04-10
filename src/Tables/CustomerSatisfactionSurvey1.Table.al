Table 52193808 "Customer Satisfaction Survey1"
{

    fields
    {
        field(1;"Survey ID";Code[20])
        {
        }
        field(2;Title;Text[250])
        {
        }
        field(3;"Date Started";Date)
        {
        }
        field(4;"Date Ended";Date)
        {
        }
        field(5;"Survey Stage";Code[10])
        {
            TableRelation = "Survey Stage1";

            trigger OnValidate()
            begin
                 if Stage.Get("Survey Stage") then
                 begin
                 "Survey Stage Description":=Stage.Description;
                 end;
            end;
        }
        field(6;"Survey Stage Description";Text[30])
        {
            Editable = false;
        }
        field(7;"No. Series";Code[10])
        {
        }
        field(8;"Implementing Agency No";Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                 if Implementer.Get("Implementing Agency No") then
                 begin
                   "Implementing Agency Name":=Implementer.Name;
                 end;
            end;
        }
        field(9;"Implementing Agency Name";Text[50])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Survey ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Survey ID" = '' then begin
          RMSetup.Get;
          RMSetup.TestField(RMSetup."Visiting Nos");
          NoSeriesMgt.InitSeries(RMSetup."Visiting Nos",xRec."No. Series",0D,"Survey ID","No. Series");
        end;
    end;

    var
        RMSetup: Record "Marketing Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Implementer: Record Vendor;
        Stage: Record "Survey Stage1";
}

