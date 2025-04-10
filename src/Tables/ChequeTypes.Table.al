Table 52193495 "Cheque Types"
{
    DrillDownPageID = "Cheque Types1";
    LookupPageID = "Cheque Types1";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[50])
        {
        }
        field(3;"Clearing Days";DateFormula)
        {
        }
        field(4;"Clearing Charges";Decimal)
        {
        }
        field(5;"Special Clearing Days";DateFormula)
        {
        }
        field(6;"Special Clearing Charges";Decimal)
        {
        }
        field(7;"Bounced Charges";Decimal)
        {
        }
        field(8;"Clearing Bank Account";Code[20])
        {
            TableRelation = "Bank Account"."No." where ("Account Type"=const(" "));

            trigger OnValidate()
            begin
                if Banks.Get("Clearing Bank Account") then begin
                "Bank Name":=Banks.Name;
                end;
            end;
        }
        field(9;"Bank Name";Text[150])
        {
        }
        field(10;"Bounced Charges GL Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(11;"Clearing Charges GL Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(12;"Clearing  Days";Integer)
        {
        }
        field(13;Percentage;Decimal)
        {
        }
        field(14;"Clearing Charge Code";Code[20])
        {
            TableRelation = "Charges - FOSA";
        }
        field(15;Type;Option)
        {
            OptionCaption = 'Local,Inhouse,Upcountry';
            OptionMembers = "Local",Inhouse,Upcountry;
        }
        field(16;"Use %";Boolean)
        {
        }
        field(17;"% Of Amount";Decimal)
        {
        }
        field(18;"Express Cheque Charges";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Banks: Record "Bank Account";
}

