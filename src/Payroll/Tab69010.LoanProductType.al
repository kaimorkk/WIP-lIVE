
table 69010 "Loan Product Type"
{
    DrillDownPageID = "Loan Products";
    LookupPageID = "Loan Products";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {

            trigger OnValidate()
            begin
                if Code <> xRec.Code then begin
                    SalesSetup.Get;
                    NoSeriesMgt.TestManual(HRsetup."Loan Product Type Nos.");
                    "No Series" := '';
                end;
            end;
        }
        field(2; Description; Text[80])
        {
        }
        field(3; "Interest Rate"; Decimal)
        {
            DecimalPlaces = 2 : 10;
        }
        field(4; "Interest Calculation Method"; Option)
        {
            OptionMembers = " ","Flat Rate","Reducing Balance";
        }
        field(5; "No Series"; Code[10])
        {
        }
        field(6; "No of Instalment"; Integer)
        {
        }
        field(7; "Loan No Series"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(8; Rounding; Option)
        {
            OptionCaption = 'Nearest,Down,Up';
            OptionMembers = Nearest,Down,Up;
        }
        field(28; "Rounding Precision"; Decimal)
        {
            InitValue = 1;
            MaxValue = 1;
            MinValue = 0.01;
        }
        field(29; "Loan Category"; Enum "Loan Category")
        {
            //OptionMembers = " ",Advance,"Sacco Loan","Other Loan";
        }
        field(30; "Calculate Interest"; Boolean)
        {
        }
        field(31; "Interest Deduction Code"; Code[10])
        {
            TableRelation = "PR Transaction Codes" where("Transaction Type" = const(Deduction));
        }
        field(32; "Deduction Code"; Code[50])
        {
            TableRelation = "PR Transaction Codes" where("Transaction Type" = const(Deduction));
        }
        field(33; Internal; Boolean)
        {
        }
        field(34; "Earning Code"; Code[50])
        {
            TableRelation = "PR Transaction Codes" where("Transaction Type" = const(Income));
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Loan Category")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if Code = '' then begin
            HRsetup.Get;
            HRsetup.TestField(HRsetup."Loan Product Type Nos.");
            NoSeriesMgt.InitSeries(HRsetup."Loan Product Type Nos.", xRec."No Series", 0D, Code, "No Series");
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRsetup: Record "Human Resources Setup";
}

