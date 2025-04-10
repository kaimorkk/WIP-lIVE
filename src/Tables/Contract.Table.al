Table 52193712 Contract
{

    fields
    {
        field(1;"Contract No";Code[20])
        {

            trigger OnValidate()
            begin
                if "Contract No" <> xRec."Contract No" then begin
                  SalesSetup.Get;
                  NoSeriesMgt.TestManual(SalesSetup."Conveyance Nos");
                  "No. Series" := '';
                end;
            end;
        }
        field(2;"Contract Service Code";Code[20])
        {
        }
        field(3;"Contract Description";Text[100])
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
        field(5;"Contract Start Date";Date)
        {
        }
        field(6;"Compliance Date";Date)
        {
        }
        field(7;"Contract Expiry Date";Date)
        {
        }
        field(8;"Contract Renewal Date";Date)
        {
        }
        field(9;"Anniversary Date";Date)
        {
        }
        field(11;"No. Series";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(12;"Service Provider";Code[20])
        {

            trigger OnValidate()
            begin
                Vend.Get("Service Provider");
                 "Service Provider Name":=Vend.Name;
                 Modify;
            end;
        }
        field(13;Amount;Decimal)
        {
        }
        field(14;"Client Vendor";Code[20])
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
        field(16;Attachment;Option)
        {
            OptionMembers = No,Yes;
        }
        field(17;"Service Provider Name";Text[80])
        {
        }
        field(18;"Law Firm Name";Text[80])
        {
        }
        field(19;"Client Name";Text[80])
        {
        }
        field(20;Durationn;Duration)
        {
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
            OptionCaption = 'Vendor,StakeHolder,PPS';
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
        field(31;"On Expiry Notice";Date)
        {
        }
        field(32;"Three Months Notice";Date)
        {
        }
        field(33;"Six Months Notice";Date)
        {
        }
        field(34;"Mode of Payment";Option)
        {
            OptionCaption = ' ,Instalment,Lumpsum';
            OptionMembers = " ",Instalment,Lumpsum;
        }
        field(35;"Payment Date";Date)
        {
        }
        field(36;"Payment Currency";Code[20])
        {
        }
        field(37;"Performance Security %";Decimal)
        {

            trigger OnValidate()
            begin
                "Performance Security Amount":=("Performance Security %"/100)*Amount;
            end;
        }
        field(38;"Performance Security Amount";Decimal)
        {
        }
        field(39;Expired;Boolean)
        {
        }
        field(40;"Tender No";Code[20])
        {
            TableRelation = "Procurement Request1".No;
        }
        field(41;"Contract Price Amt(Words)";Text[100])
        {
        }
        field(42;"Performance Security(Words)";Text[100])
        {
        }
        field(43;Performance;Option)
        {
            OptionCaption = ' ,Unsatisfactory,Poor,Satisfactory,Good,Excellent';
            OptionMembers = " ",Unsatisfactory,Poor,Satisfactory,Good,Excellent;
        }
        field(44;"Contract Award Date";Date)
        {
        }
        field(45;"Contract Signing Date";Date)
        {
        }
        field(46;Status;Option)
        {
            OptionCaption = 'Open,Released,Pending Approval,Pending Prepayment,Rejected,Archived,Canceled,Contracted,Awarded';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment",Rejected,Archived,Canceled,Contracted,Awarded;
        }
        field(47;"Agreement Type";Option)
        {
            OptionCaption = ' ,SLA,Consultancy,Lease,MOU''s,Research Collaborations';
            OptionMembers = " ",SLA,Consultancy,Lease,"MOU's","Research Collaborations";
        }
        field(48;"Contract Status";Option)
        {
            OptionCaption = ' ,Ongoing,Awaiting Renewal,Terminate,Awarded';
            OptionMembers = " ",Ongoing,"Awaiting Renewal",Terminate,Awarded;
        }
        field(49;"Performance Security Exp Date";Date)
        {
        }
        field(50;Comments;Text[100])
        {
        }
        field(51;"Contract Renewal Clause";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Contract No")
        {
            Clustered = true;
        }
        key(Key2;Performance)
        {
        }
        key(Key3;"Agreement Type")
        {
        }
        key(Key4;"Contract Renewal Clause")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Contract No" = '' then begin
          SalesSetup.Get;
          SalesSetup.TestField("Conveyance Nos");
          NoSeriesMgt.InitSeries(SalesSetup."Conveyance Nos",xRec."No. Series",0D,"Contract No","No. Series");
        end;

        IntakeChecklistFormat.Reset;
        if IntakeChecklistFormat.Find('-') then begin
        repeat
         IntakeChecklist.Init;
         IntakeChecklist.No:=IntakeChecklist.No+1;
         IntakeChecklist.Description:=IntakeChecklistFormat.Description;
         IntakeChecklist.Insert;
        until IntakeChecklistFormat.Next=0;
        end;

        ContractFactSheetFormat.Reset;
        if ContractFactSheetFormat.Find('-') then begin
        repeat
         ContractFactSheet.Init;
         ContractFactSheet.No:=ContractFactSheet.No+1;
         ContractFactSheet.Description:=ContractFactSheetFormat.Description;
         ContractFactSheet.Insert;
        until ContractFactSheetFormat.Next=0;
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
        LegalSetup: Record "Resource Centre Setup1";
        Text000: label 'Are you sure you want to renew the contract %1 ?';
        Text001: label 'Are you sure you want to terminate the contract %1 ?';
        Text002: label 'Legal Setup doesn''''t exist';
        Text003: label 'Are you sure you want to award the contract %1 to %2 ?';
        Text004: label 'Are you sure you want to convert the award %1 into a contract with %2 ?';
        ContractFactSheet: Record "Contract Fact Sheet";
        ContractFactSheetFormat: Record "3rd Party Contract Obligations";
        IntakeChecklist: Record "Contract Intake Checklist";
        IntakeChecklistFormat: Record "3rd Part Contract Deliverables";


    procedure AssistEdit(OldContract: Record Contract): Boolean
    var
        Contract: Record Contract;
    begin
        with Contract do begin
          Contract := Rec;
          SalesSetup.Get;
          SalesSetup.TestField("Conveyance Nos");
          if NoSeriesMgt.SelectSeries(SalesSetup."Conveyance Nos",OldContract."No. Series","No. Series") then begin
            NoSeriesMgt.SetSeries("Contract No");
            Rec := Contract;
            exit(true);
          end;
        end;
    end;


    procedure CalcDates()
    var
        "3months": DateFormula;
        "6months": DateFormula;
    begin
        if not LegalSetup.Get then
          Error(Text002);
         LegalSetup.TestField("On Three Months Notice");
         LegalSetup.TestField("On Six Months Notice");
        "On Expiry Notice":="Contract Expiry Date";
        if ("Contract Expiry Date"<>0D) and ("Contract Start Date"<>0D) then begin
        Durationn:="Contract Expiry Date"-"Contract Start Date";
        "Three Months Notice":=CalcDate(LegalSetup."On Three Months Notice","Contract Expiry Date");
        "Six Months Notice":=CalcDate(LegalSetup."On Six Months Notice","Contract Expiry Date");
        end;
    end;


    procedure RenewContract()
    begin
        if not Confirm(Text000,false,"Contract No") then
         exit;
        Page.Run(51511709,Rec);
         Modify;
    end;


    procedure TerminateContract()
    begin
        if not Confirm(Text001,false,"Contract No") then
         exit;
        "Contract Status":="contract status"::Terminate;
         Modify;

        Page.Run(51511700,Rec);
    end;


    procedure AwardContract()
    begin
        if not Confirm(Text003,false,"Contract No","Service Provider Name") then
         exit;
        "Contract Status":="contract status"::Awarded;
         Modify;

        Page.Run(51511734,Rec);
    end;


    procedure ConvertIntoContract()
    begin
        if not Confirm(Text004,false,"Contract No","Service Provider Name") then
         exit;
        //PAGE.RUN(51511700,Rec);
        "Contract Status":="contract status"::Ongoing;
         Modify;
    end;
}

