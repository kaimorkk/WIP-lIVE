Table 52193670 "Tender Commitee Appointment"
{
    // DrillDownPageID = "Fuel Card Lines";
    // LookupPageID = "Fuel Card Lines";

    fields
    {
        field(1;"Tender/Quotation No";Code[20])
        {
            TableRelation = "Procurement Request";

            trigger OnValidate()
            begin
                 if TenderRec.Get("Tender/Quotation No") then
                  begin
                  Title:=TenderRec.Title;
                  end;
            end;
        }
        field(2;"Committee ID";Code[20])
        {

            trigger OnLookup()
            begin
                ProcurementComittee.SetRange(ProcurementComittee.Permanent,false);
                if Page.RunModal(59015,ProcurementComittee)=Action::LookupOK then begin
                   "Committee ID":=ProcurementComittee.Code;
                   "Committee Name":=ProcurementComittee.Description;
                end;
            end;

            trigger OnValidate()
            begin
                  if ProcurementComittee.Get("Committee ID") then
                  begin
                     "Committee Name":=ProcurementComittee.Description;

                  end;
            end;
        }
        field(3;"Committee Name";Text[30])
        {
        }
        field(4;"Creation Date";Date)
        {
        }
        field(5;"User ID";Code[20])
        {
        }
        field(6;Title;Text[250])
        {
        }
        field(7;"Appointment No";Code[20])
        {
        }
        field(8;"No. Series";Code[10])
        {
        }
        field(9;Status;Option)
        {
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
    }

    keys
    {
        key(Key1;"Appointment No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
          PurchSetup.Get;
          PurchSetup.TestField(PurchSetup."Appointment Nos.");
          NoSeriesMgt.InitSeries(PurchSetup."Appointment Nos.",xRec."Appointment No",0D,"Appointment No","No. Series");
          //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");


         "Creation Date":=Today;
         "User ID":=UserId;
    end;

    var
        ProcurementComittee: Record "Procurement Commitee";
        TenderRec: Record "Procurement Request";
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

