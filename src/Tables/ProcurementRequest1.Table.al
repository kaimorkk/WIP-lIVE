Table 52193790 "Procurement Request1"
{
    DrillDownPageID = "Procurement Request List";
    LookupPageID = "Procurement Request List";

    fields
    {
        field(1;No;Code[50])
        {
        }
        field(2;Title;Text[250])
        {
        }
        field(3;"Requisition No";Code[20])
        {
            TableRelation = "Requisition Header1";

            trigger OnValidate()
            begin


                   RequisitionLines.Reset;
                   RequisitionLines.SetRange(RequisitionLines."Requisition No","Requisition No");
                   if RequisitionLines.Find('-') then
                   repeat
                     RFQLines."Line No":=RFQLines."Line No"+1;
                     RFQLines."Requisition No":=No;
                    // RFQLines."Line No":=RFQLines."Line No";
                     RFQLines.Type:=RequisitionLines.Type;
                     RFQLines.No:=RequisitionLines.No;
                     RFQLines.Description:=RequisitionLines.Description;
                     RFQLines.Quantity:=RequisitionLines.Quantity;
                     RFQLines."Unit of Measure":=RequisitionLines."Unit of Measure";
                    //  RFQLines."Unit Price":=RequisitionLines."Unit Price";
                     RFQLines.Amount:=RequisitionLines.Amount;
                     RFQLines."Procurement Plan":=RequisitionLines."Procurement Plan";
                     RFQLines."Procurement Plan Item":=RequisitionLines."Procurement Plan Item";
                     RFQLines."Budget Line":=RequisitionLines."Budget Line";
                     RFQLines."Global Dimension 1 Code":=RequisitionLines."Global Dimension 1 Code";
                     RFQLines."Amount LCY":=RequisitionLines."Amount LCY";
                     if not RFQLines.Get(RFQLines."Requisition No",RFQLines."Line No") then
                     RFQLines.Insert;
                   until RequisitionLines.Next=0;
            end;
        }
        field(4;"Procurement Plan No";Code[50])
        {
            TableRelation = "Procurement Plan1";

            trigger OnValidate()
            begin
                  if "Process Type"="process type"::RFQ then
                  begin
                  "Document No":='PPOA/RFQ/'+No+'/'+"Procurement Plan No";
                  end;

                  if "Process Type"="process type"::RFP then
                  begin
                    "Document No":='PPOA/RFP/'+No+'/'+"Procurement Plan No";
                  end;
                  if "Process Type"="process type"::EOI then
                  begin
                    "Document No":='PPOA/'+No+'/'+"Procurement Plan No";
                  end;

                  if "Process Type"="process type"::Direct then
                  begin
                    "Document No":='PPOA/DIR/'+No+'/'+"Procurement Plan No";
                  end;

                  if "Process Type"="process type"::"Specially Permitted" then
                  begin
                    "Document No":='PPOA/SP/'+No+'/'+"Procurement Plan No";
                  end;
            end;
        }
        field(5;"Creation Date";Date)
        {
            Editable = false;
        }
        field(6;"User ID";Code[30])
        {
            Editable = false;
        }
        field(7;"Procurement Method";Code[20])
        {
            TableRelation = "Procurement Plan1";
        }
        field(8;"No.Series";Code[100])
        {
        }
        field(9;"Process Type";Option)
        {
            OptionCaption = ' ,Direct,RFQ,RFP,Tender,Low Value,Specially Permitted,EOI';
            OptionMembers = " ",Direct,RFQ,RFP,Tender,"Low Value","Specially Permitted",EOI;
        }
        field(10;"Procurement Plan Item";Code[50])
        {
            TableRelation = "Procurement Plan1"."Plan Item No" where ("Plan Year"=field("Procurement Plan No"));
        }
        field(11;"Supplier Category";Code[250])
        {
            TableRelation = "Supplier Category1";
        }
        field(12;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
                
                /*
                PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN  BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 2 Code":="Global Dimension 2 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                END;
                */

            end;
        }
        field(13;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 3 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                /*
                PurchaseReqDet.RESET;
                PurchaseReqDet.SETRANGE(PurchaseReqDet."Requistion No.","Requisition No.");
                
                IF PurchaseReqDet.FIND('-') THEN BEGIN
                REPEAT
                PurchaseReqDet."Global Dimension 3 Code":="Global Dimension 3 Code";
                PurchaseReqDet.MODIFY;
                UNTIL PurchaseReqDet.NEXT=0;
                
                 END;
                
                {
                IF "Global Dimension 2 Code" = '' THEN
                  EXIT;
                GetGLSetup;
                ValidateDimValue(GLSetup."Global Dimension 2 Code","Global Dimension 2 Code");
                
                }
                */

            end;
        }
        field(14;"Tender Opening Date";DateTime)
        {
        }
        field(15;"Tender Status";Option)
        {
            OptionCaption = ' ,New Tender,Retender,Approved,Cancelled,Postponed';
            OptionMembers = " ","New Tender",Retender,Approved,Cancelled,Postponed;
        }
        field(16;"Tender Closing Date";DateTime)
        {
        }
        field(18;Addedum;Text[30])
        {
        }
        field(19;SiteView;DateTime)
        {
        }
        field(20;Status;Option)
        {
            OptionCaption = 'New,Archived,Released';
            OptionMembers = New,Archived,"Pending Approval",Released;
        }
        field(21;"Return Date";Date)
        {
            Editable = true;
        }
        field(22;"Return Time";Time)
        {
        }
        field(23;"Tender Type";Option)
        {
            OptionCaption = ' ,Open National,Open International,Restricted';
            OptionMembers = " ","Open National","Open International",Restricted;

            trigger OnValidate()
            begin

                  if "Process Type"="process type"::Tender then
                  begin
                   if "Tender Type"="tender type"::"Open National" then
                    "Document No":='CMA/ONT/'+No+'/'+"Procurement Plan No"
                   else if "Tender Type"="tender type"::"Open International" then
                     "Document No":='CMA/OIT/'+No+'/'+"Procurement Plan No"
                   else if "Tender Type"="tender type"::Restricted then
                     "Document No":='CMA/RT/'+No+'/'+"Procurement Plan No"
                   else
                     "Document No":='';
                  end;
            end;
        }
        field(24;"Document No";Code[30])
        {
        }
        field(25;"No of Tender Documents";Integer)
        {
            CalcFormula = count(Bidders1 where ("Ref No."=field(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(26;"Extended Date";Date)
        {
        }
        field(27;"Currency Code";Code[20])
        {
            TableRelation = Currency;
        }
        field(28;"Tender Amount";Decimal)
        {
        }
        field(29;"Validity Period";DateFormula)
        {

            trigger OnValidate()
            begin
                if "Tender Opening Date"<>0DT then begin
                  "Return Date":=CalcDate("Validity Period",Dt2Date("Tender Opening Date"));

                end;
            end;
        }
        field(30;"Issued Date";Date)
        {
        }
        field(31;"Questionaire Document";Text[250])
        {
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if No = '' then begin

          //MESSAGE('No is empty');

        TestField("Process Type");

          if "Process Type"="process type"::RFQ then
          begin
          PurchSetup.Get;
          PurchSetup.TestField(PurchSetup."Request for Quotation Nos.");
          NoSeriesMgt.InitSeries(PurchSetup."Request for Quotation Nos.",xRec."No.Series",0D,No,"No.Series");
          //NoSeriesMgt.InitSeries(DefaultNoSeriesCode,OldNoSeriesCode,NewDate,NewNo,NewNoSeriesCode)

          //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
          end;

          if "Process Type"="process type"::RFP then
         // MESSAGE('%1',PurchSetup."Direct Prcmnt Nos");
          begin
          PurchSetup.Get;
          PurchSetup.TestField(PurchSetup."Request for Proposals Nos.");
          NoSeriesMgt.InitSeries(PurchSetup."Request for Proposals Nos.",xRec."No.Series",0D,No,"No.Series");
          //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
          end;

          if "Process Type"="process type"::EOI then
         // MESSAGE('%1',PurchSetup."Direct Prcmnt Nos");
          begin
          PurchSetup.Get;
          PurchSetup.TestField(PurchSetup."Expression of Interest Nos.");
          NoSeriesMgt.InitSeries(PurchSetup."Expression of Interest Nos.",xRec."No.Series",0D,No,"No.Series");
          //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
          end;


          if "Process Type"="process type"::Tender then
          begin
          PurchSetup.Get;
          PurchSetup.TestField(PurchSetup."Tenders Nos");
          NoSeriesMgt.InitSeries(PurchSetup."Tenders Nos",xRec."No.Series",0D,No,"No.Series");
          //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
          end;

          if "Process Type"="process type"::Direct then
          begin
          PurchSetup.Get;
          PurchSetup.TestField(PurchSetup."Direct Prcmnt Nos");
          NoSeriesMgt.InitSeries(PurchSetup."Direct Prcmnt Nos",xRec."No.Series",0D,No,"No.Series");
          //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
          end;

          if "Process Type"="process type"::"Specially Permitted" then
          begin
          PurchSetup.Get;
          PurchSetup.TestField(PurchSetup."Specially Permitted Prcmnt Nos");
          NoSeriesMgt.InitSeries(PurchSetup."Specially Permitted Prcmnt Nos",xRec."No.Series",0D,No,"No.Series");
         // NoSeriesMgt.InitSeries(DefaultNoSeriesCode,OldNoSeriesCode,NewDate,NewNo,NewNoSeriesCode)
          //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
          end;

          if "Process Type"="process type"::"Low Value" then
          begin
          PurchSetup.Get;
          PurchSetup.TestField(PurchSetup."Low Value Prcmnt Nos");
          NoSeriesMgt.InitSeries(PurchSetup."Low Value Prcmnt Nos",xRec."No.Series",0D,No,"No.Series");
          //NoSeriesMgt.InitSeries(SalesSetup."File Movement Numbers",xRec."File Movement Code",0D,"File Movement Code","No. Series");
          end;

        end;

        "User ID":=UserId;
        "Creation Date":=Today;
    end;

    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        RequisitionHeader: Record "Requisition Header1";
        RequisitionLines: Record "Requisition Lines1";
        RFQLines: Record "Procurement Request Lines1";
        CurrExchRate: Record "Currency Exchange Rate";
}

