Table 52193757 "Power purchase Agreements1"
{
    DrillDownPageID = "Contract List1";
    LookupPageID = "Contract List1";

    fields
    {
        field(1;"Conveyance Code";Code[20])
        {

            trigger OnValidate()
            begin
                if "Conveyance Code" <> xRec."Conveyance Code" then begin
                  SalesSetup.Get;
                  NoSeriesMgt.TestManual(SalesSetup."Conveyance Nos");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;"Coveyance Service Code";Code[10])
        {
        }
        field(3;"Conveyance Serv. Desc.";Text[100])
        {
        }
        field(4;"Law Firm";Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                 Vend.Get("Law Firm");
                 "Law Firm Name":=Vend.Name;
                 Modify;
            end;
        }
        field(5;"Start date";Date)
        {
        }
        field(6;"Compliance date";Date)
        {
        }
        field(7;"Expiry Date";Date)
        {

            trigger OnValidate()
            begin
                //Duration:="Expiry Date"-"Start date"
                  Notification.Get;
                  "One Month Notice":=CalcDate(Notification."One Month Notice","Expiry Date");
                  "Two Month Notice":=CalcDate(Notification."Tow Months Notice","Expiry Date");
                  "Two Weeks Notice":=CalcDate(Notification."Two Weeks Notice","Expiry Date");
            end;
        }
        field(8;"Renewal date";Date)
        {
        }
        field(9;"Anniversary date";Date)
        {
        }
        field(11;"No. Series";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(12;"Service Provider";Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                 Vend.Get("Service Provider");
                 "Service provider name":=Vend.Name;
                 Modify;
            end;
        }
        field(13;Amount;Decimal)
        {
        }
        field(14;"Client Vendor";Code[10])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                 if Type=Type::Vendor then  begin
                 Vend.Get("Client Vendor");
                 "Client Name":=Vend.Name;
                 Modify;
                 end else
                 Error('The Type must be Vendor');
            end;
        }
        field(15;"Language Code (Default)";Code[10])
        {
        }
        field(16;Attachement;Option)
        {
            OptionMembers = No,Yes;
        }
        field(17;"Service provider name";Text[80])
        {
        }
        field(18;"Law Firm Name";Text[80])
        {
        }
        field(19;"Client Name";Text[80])
        {
        }
        field(20;Duration;DateFormula)
        {

            trigger OnValidate()
            begin
                   "Expiry Date":=CalcDate(Duration,"Start date") ;
                  Notification.Get;
                  "One Month Notice":=CalcDate(Notification."One Month Notice","Expiry Date");
                  "Two Month Notice":=CalcDate(Notification."Tow Months Notice","Expiry Date");
                  "Two Weeks Notice":=CalcDate(Notification."Two Weeks Notice","Expiry Date");
            end;
        }
        field(21;Property;Code[20])
        {
            TableRelation = "Fixed Asset" where ("FA Subclass Code"=const('PROPERTY'));

            trigger OnValidate()
            begin
                if FA.Get(Property)   then
                "Property Name":=FA.Description
                else
                "Property Name":='';
            end;
        }
        field(22;"Property Name";Text[100])
        {
        }
        field(23;"Service Provider Category";Code[20])
        {
            TableRelation = "Vendor Posting Group";
        }
        field(24;"Payment Schedule";Decimal)
        {
        }
        field(25;Vote;Code[20])
        {
        }
        field(26;Type;Option)
        {
            OptionMembers = Vendor,StakeHolder,PPS;
        }
        field(27;"Client StakeHolder";Code[20])
        {

            trigger OnLookup()
            begin

                if Type=Type::Vendor then begin
                  if Page.RunModal(27,Vend)=Action::LookupOK then begin
                  "Client StakeHolder":=Vend."No.";
                  "StakeHolder Name":=Vend.Name;
                  end;
                end else begin
                if Type=Type::StakeHolder then begin
                  if Page.RunModal(5052,Contact)=Action::LookupOK then begin
                  "Client StakeHolder":=Contact."No.";
                  "StakeHolder Name":=Contact.Name;
                  end;
                  end;
                  end;
            end;
        }
        field(28;"StakeHolder Name";Text[100])
        {
        }
        field(29;"Client PPS";Code[10])
        {
        }
        field(30;"PPS Name";Text[100])
        {
        }
        field(31;"One Month Notice";Date)
        {
        }
        field(32;"Two Month Notice";Date)
        {
        }
        field(33;"Two Weeks Notice";Date)
        {
        }
        field(34;"Project Name";Text[100])
        {
        }
        field(35;"Approval Date";Date)
        {
        }
    }

    keys
    {
        key(Key1;"Conveyance Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Conveyance Code" = '' then begin
          SalesSetup.Get;
          SalesSetup.TestField("Conveyance Nos");
          NoSeriesMgt.InitSeries(SalesSetup."Conveyance Nos",xRec."Conveyance Code",0D,"Conveyance Code","No. Series");
        end;
    end;

    var
        SalesSetup: Record "Resource Centre Setup1";
        CommentLine: Record "Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Vend: Record Vendor;
        Cust: Record Customer;
        FA: Record "Fixed Asset";
        Contact: Record Contact;
        Notification: Record "Notification Dates1";
}

