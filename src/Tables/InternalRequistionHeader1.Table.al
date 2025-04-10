Table 52193693 "Internal Requistion Header1"
{
    // DrillDownPageID = "Posted Leave Recalls";
    // LookupPageID = "Posted Leave Recalls";

    fields
    {
        field(1;No;Code[20])
        {

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    GenLedgerSetup.Get();
                    NoSeriesMgt.TestManual( GenLedgerSetup."Effective Procurement Plan");
                     No := '';
                end;
            end;
        }
        field(2;"Request date";Date)
        {
        }
        field(3;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(4;"Global Dimension 2 Code";Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(5;"Required Date";Date)
        {
        }
        field(6;"Requester ID";Code[20])
        {
            Caption = 'Requester ID';
            Editable = false;
            TableRelation = User;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            var
                LoginMgt: Codeunit "User Management";
            begin
            end;

            trigger OnValidate()
            var
                LoginMgt: Codeunit "User Management";
            begin
            end;
        }
        field(7;Description;Text[50])
        {
        }
        field(9;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10;Status;Option)
        {
            OptionMembers = Open,Released,Closed,Rejected;
        }
        field(11;Supplier;Code[20])
        {
            TableRelation = Vendor;
        }
        field(12;"Requestion No.";Code[10])
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

    trigger OnDelete()
    begin
          if Status<>Status::Open then
             Error('You Cannot DELETE an already Released Requisition')
    end;

    trigger OnInsert()
    begin
        /*
        IF No = '' THEN BEGIN
         GenLedgerSetup.GET();
          GenLedgerSetup.TESTFIELD(GenLedgerSetup."Requisition No");
          NoSeriesMgt.InitSeries(GenLedgerSetup."Requisition No",xRec.No,0D,No,No);
        END;
        */
        if No = '' then begin
          GenLedgerSetup.Get();
          GenLedgerSetup.TestField(GenLedgerSetup."Effective Procurement Plan");
          NoSeriesMgt.InitSeries(GenLedgerSetup."Effective Procurement Plan",xRec."No. Series",0D,No,"No. Series");
        end;
        
        
        
        "Request date":=Today;
        "Requester ID":=UserId;

    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GenLedgerSetup: Record "Purchases & Payables Setup";
}

